module ApplicationHelper
  def asset_url_for(type)
    webpack_assets = JSON.parse(File.read('./webpack-assets.json'))
    asset_url(webpack_assets.dig('app', type), skip_pipeline: true)
  end
end
