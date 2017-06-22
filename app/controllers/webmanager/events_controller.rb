require_dependency "webmanager/application_controller"

module Webmanager
  class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    # GET /events
    def index
      @events = Event.all
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      @events_by_date = @events.group_by(&:start_date)
    end

    # GET /events/1
    def show
    end

    # GET /events/new
    def new
      @event = Event.new
    end

    # GET /events/1/edit
    def edit
    end

    # POST /events
    def create
      @event = Event.new(event_params)

      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /events/1
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /events/1
    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end

    def notify
      NewsletterReceiver.all.each do |s|
        EventsMailer.attend_event(s.email, params[:event]).deliver
      end
      redirect_to :back, notice: 'Everyone notified successfully!'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :description, :start_date, :end_time, :location, :organizer)
    end
  end
end
