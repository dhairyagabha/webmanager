module Webmanager
  module ArticlesHelper

    def tag_list
      tag_list = Tag.all.map{|t| [t.name, t.id]}
      return tag_list
    end

  end
end
