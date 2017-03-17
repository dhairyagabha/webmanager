require_dependency "webmanager/application_controller"

module Webmanager
  class NotesController < ApplicationController
    def index
      set_note
      @notes = Note.all
    end

    def show
      @note = Note.find(params[:id])
    end

    def create
      @note = current_user.notes.new(note_params)
      respond_to do |format|
        if @note.save
          format.html { redirect_to notes_path, notice: @note.title.titleize + ' was successfully created!' }
          format.json { render :show, status: :created, location: @note }
        else
          format.html { render :index }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @note = Note.find(params[:id])
      redirect_to notes_path(id: @note)
    end

    def update
      @note = Note.find(params[:id])
      respond_to do |format|
        if @note.update(note_params)
          format.html { redirect_to notes_path, notice: @note.title.titleize + ' was successfully updated!' }
          format.json { render :show, status: :created, location: note }
        else
          format.html { render :index }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @note = Note.find(params[:id])
      @note.destroy
      respond_to do |format|
        format.html { redirect_to notes_url, notice: @note.title.titleize + ' was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    def note_params
      params.require(:note).permit(:id, :title, :body, :author_id)
    end

    def set_note
      if params[:id].present?
        @note = Note.find(params[:id])
      else
        @note = current_user.notes.new
      end
    end

  end
end
