module Webmanager
  class Article < ApplicationRecord
    validates_presence_of :title, :author_id, :permalink
    belongs_to :webmanager_user, :class_name => 'Webmanager::User', :foreign_key => 'author_id'


  end
end
