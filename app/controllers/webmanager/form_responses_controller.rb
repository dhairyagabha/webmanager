require_dependency "webmanager/application_controller"

module Webmanager
  class FormResponsesController < ApplicationController


    def create
      id = params["form_response"]["form_id"].to_i
      @form = Form.find_by(id: id)
      @form_response = @form.form_responses.new(form_response_params)
      @form_response.response = params["form_response"]["response"].to_unsafe_h
      @form_response.save!
    end

    private
    def form_response_params
      params.require(:form_response).permit(:form_id, :response)
    end
  end
end
