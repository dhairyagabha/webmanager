module Webmanager
  class Form < ApplicationRecord

    has_many :form_fields, :class_name => 'Webmanager::FormField', dependent: :destroy
    has_many :form_responses
    accepts_nested_attributes_for :form_fields, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :form_responses

    validates_presence_of :name
  end
end
