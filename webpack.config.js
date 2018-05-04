require('dotenv').config()
const { resolve } = require('path')

const webpack = require('webpack')
const CleanPlugin = require('clean-webpack-plugin')
const ManifestPlugin = require('webpack-manifest-plugin')

const assetsPath = resolve(__dirname, './public/dist')
const port = parseInt(process.env.PORT) + 1

const config = {
  entry: {
    app: './client/index.js'
  },

  output: {
    path: assetsPath,
    filename: '[name].js',
    chunkFilename: '[name].js',
    publicPath: '/dist/',
  },

  module: {
    rules: [
      {
        test: /\.(jpg|png|svg|otf|ttf|eot|woff(2)?)(\?v=\d+\.\d+\.\d+)?$/,
        include: [resolve('./public'), resolve('./node_modules')],
        loader: 'url-loader',
        options: { limit: 10240, name: '[name].[ext]' }
      },
      {
        test: /\.js$/,
        include: resolve('./client'),
        loader: 'babel-loader',
        options: { cacheDirectory: true }
      }
    ]
  },

  plugins: [
    new webpack.EnvironmentPlugin({
      PUBLIC_URL: null
    }),
    new ManifestPlugin({ writeToFileEmit: true })
  ],

  resolve: {
    modules: [
      'client',
      'node_modules'
    ]
  },

  devServer: {
    port,
    allowedHosts: ['localhost', '.lvh.me'],
    hot: true,
    hotOnly: true,
    headers: {
      'Access-Control-Allow-Origin': '*',
    }
  }
}

module.exports = (env, argv) => {
  if (argv.mode !== 'production') {
    config.devtool = 'cheap-module-source-map'
    config.output.publicPath = `${process.env.PUBLIC_URL}:${port}/dist/`
    config.plugins.push(new webpack.HotModuleReplacementPlugin())
  } else {
    config.output.filename = '[name]-[hash].js'
    config.output.chunkFilename = '[name]-[hash].js'

    config.plugins.push(new CleanPlugin([assetsPath], { verbose: false }))
  }

  return config
}
