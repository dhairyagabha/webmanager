require_dependency "webmanager/application_controller"

module Webmanager
  class NewsletterReceiversController < ApplicationController

    def index
      @subscribers = NewsletterReceiver.all
      @subscriber = NewsletterReceiver.new
    end

    def create
      @subscriber = NewsletterReceiver.new(subscription_params)
      if @subscriber.save
        redirect_back root_path
      end
    end

    def destroy
      @subscriber = NewsletterReceiver.find(params[:id])
      @subscriber.destroy
      respond_to do |format|
        format.html { redirect_to newsletter_receivers_url, notice: 'Subscription was cancelled successfully!' }
        format.json { head :no_content }
      end
    end
    private
    def subscription_params
      params.permit(:name, :email, :event_notification)
    end
  end
end
