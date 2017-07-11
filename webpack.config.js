'use strict'

require('dotenv').config()
const path = require('path')

const webpack = require('webpack')
const CleanPlugin = require('clean-webpack-plugin')
const AssetsPlugin = require('assets-webpack-plugin')
const BabiliPlugin = require('babili-webpack-plugin')

const assetsPath = path.resolve(__dirname, './public/dist')
const port = parseInt(process.env.PORT) + 1

const config = {
  entry: {
    app: './client/index.js'
  },

  output: {
    path:          assetsPath,
    filename:      '[name].js',
    chunkFilename: '[name].js',
    publicPath:    '/dist/'
  },

  module: {
    rules: [
      {
        test:    /\.(jpg|png|svg|otf|ttf|eot|woff(2)?)(\?v=\d+\.\d+\.\d+)?$/,
        include: [ path.resolve('./public'), path.resolve('./node_modules') ],
        loader:  'url-loader',
        options: { limit: 10240, name: '[name].[ext]' }
      },
      {
        test:    /\.js$/,
        include: path.resolve(__dirname, "./client"),
        loader:  'babel-loader',
        options: { cacheDirectory: true }
      }
    ]
  },

  plugins: [
    new webpack.EnvironmentPlugin({
      NODE_ENV: 'development',
      PUBLIC_URL: null
    }),
    new AssetsPlugin(),
    new webpack.NamedModulesPlugin()
  ],

  resolve: {
    alias: {
      'react':     'preact-compat',
      'react-dom': 'preact-compat',
    },
    modules: [
      'client',
      'node_modules'
    ]
  },

  devServer: {
    port,
    allowedHosts: [ 'localhost', '.lvh.me' ],
    hot: true,
    hotOnly: true,
    headers: {
      'Access-Control-Allow-Origin': '*',
    }
  }
}

if (process.env.NODE_ENV !== 'production') {
  config.devtool = 'cheap-module-source-map'
  config.output.publicPath = `${process.env.PUBLIC_URL}:${port}/dist/`
  config.plugins.push(new webpack.HotModuleReplacementPlugin())
} else {
  config.output.filename = '[name]-[hash].js'
  config.output.chunkFilename = '[name]-[hash].js'

  config.plugins.push(new webpack.optimize.ModuleConcatenationPlugin())
  config.plugins.push(new CleanPlugin([assetsPath], {verbose: false}))
  config.plugins.push(new BabiliPlugin())
}

module.exports = config
