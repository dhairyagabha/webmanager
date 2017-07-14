require_dependency "webmanager/application_controller"

module Webmanager
  class FormResponsesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @responses = FormResponse.all
    end

    def create
      id = params["form_response"]["form_id"].to_i
      @form = Form.find_by(id: id)
      @form_response = @form.form_responses.new(form_response_params)
      @form_response.response = params["form_response"]["response"].to_unsafe_h
      if @form_response.save!
        FormResponseMailer.query_received(@form_response).deliver
        redirect_to :back, notice: @form.success_message
      end
    end

    def show
      @response = FormResponse.find(params[:id])
    end

    private
    def form_response_params
      params.require(:form_response).permit(:form_id, :response)
    end
  end
end
