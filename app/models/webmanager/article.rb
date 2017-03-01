module Webmanager
  class Article < ApplicationRecord
    belongs_to :webmanager_user, :class_name => 'Webmanager::User', :foreign_key => 'author_id'
  end
end
