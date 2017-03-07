module Webmanager
  class FormField < ApplicationRecord
    belongs_to :forms, :class_name => 'Webmanager::Form', optional: true
  end
end
