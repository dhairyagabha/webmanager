require_dependency "webmanager/application_controller"

module Webmanager
  class BlogAssetsController < ApplicationController
    def index
      @assets = BlogAsset.all
      @new_asset = BlogAsset.new
    end

    def create
      # abort(params.inspect)
      @asset = BlogAsset.new(asset_params)
      if @asset.save
        redirect_to :back
      end
    end

    private
    def asset_params
      params.require(:blog_asset).permit(:id, :asset, :dimensions)
    end
  end
end
