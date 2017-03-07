require_dependency "webmanager/application_controller"

module Webmanager
  class FormFieldsController < ApplicationController
    def new
      @form_field = FormField.new
    end
    def create
      @form_field = FormField.new(form_field_params)
      @form_field.save!
    end
    def edit
      @form_field = FormField.find(params[:id])
    end
    def update
      @form_field = FormField.find(params[:id])
      @form_field.update(form_field_params)
    end
    private
    def form_field_params
      params.require(:form_field).permit(:webmanager_form_id, :name, :label, :hint, :placeholder, :as, :collection, :disabled, :required)
    end
  end
end
