module Webmanager
  class Event < ApplicationRecord
    validates_presence_of :name, :location
  end
end
