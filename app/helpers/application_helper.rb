module ApplicationHelper
  def asset_url_for(asset)
    webpack_assets = JSON.parse(File.read('./public/dist/manifest.json'))
    asset_url(webpack_assets[asset], skip_pipeline: true)
  end
end
