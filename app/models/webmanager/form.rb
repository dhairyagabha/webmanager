module Webmanager
  class Form < ApplicationRecord

    has_many :form_fields, :class_name => 'Webmanager::FormField', dependent: :destroy
    accepts_nested_attributes_for :form_fields, :allow_destroy => true

    validates_presence_of :name
  end
end
