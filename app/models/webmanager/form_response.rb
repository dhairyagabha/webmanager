module Webmanager
  class FormResponse < ApplicationRecord
    belongs_to :form

    serialize :response
  end
end
