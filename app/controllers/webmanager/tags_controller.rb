require_dependency "webmanager/application_controller"

module Webmanager
  class TagsController < ApplicationController
    respond_to :html, :json
    def index
      @tags = Tag.all
      @tags_list = Tag.all.map{|t| [t.name, t.id]}
      respond_with @tags_list
    end

  end
end
