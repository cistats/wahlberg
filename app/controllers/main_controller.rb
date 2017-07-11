class MainController < ApplicationController
  def index
    @assets = JSON.parse(File.read('./webpack-assets.json'))
  end
end
