module Webmanager
  class Note < ApplicationRecord
    belongs_to :webmanager_user, :class_name => 'Webmanager::User'
  end
end
