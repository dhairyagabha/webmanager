require_dependency "webmanager/application_controller"

module Webmanager
  class NewsletterReceiversController < ApplicationController

    def create
      @subscriber = NewsletterReceiver.new(subscription_params)
      if @subscriber.save
        redirect_to :back
      end
    end

    private
    def subscription_params
      params.permit(:name, :email, :event_notification)
    end
  end
end
