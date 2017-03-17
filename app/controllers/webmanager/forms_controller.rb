require_dependency "webmanager/application_controller"

module Webmanager
  class FormsController < ApplicationController

    def index
      @forms = Form.all
    end

    def show
      @form = Form.find(params[:id])
    end

    def new
      @form = Form.new
      @form.form_fields.build
    end

    def create
      @form = Form.new(form_params)
      @form.form_fields.name.downcase.gsub(' ','_')
      respond_to do |format|
        if @form.save
          format.html { redirect_to @form, notice: 'Form was successfully created!' }
          format.json { render :show, status: :created, location: form }
        else
          format.html { render :new }
          format.json { render json: form.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @form = Form.find(params[:id])
    end

    def update
      @form = Form.find(params[:id])
      respond_to do |format|
        if @form.update(form_params)
          format.html { redirect_to @form, notice: 'Form was successfully updated!' }
          format.json { render :show, status: :created, location: form }
        else
          format.html { render :edit }
          format.json { render json: form.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @form = Form.find(params[:id])
      if @form.destroy
        redirect_to forms_path, notice: 'Form deleted successfully!'
      end
    end

    private
    def form_params
      params.require(:form).permit(:id, :name, :description, :success_message, :primary_mail, form_fields_attributes: [:id, :form_id, :name, :label, :hint, :placeholder, :as, :collection, :disabled, :required, :_destroy])
    end
  end
end
