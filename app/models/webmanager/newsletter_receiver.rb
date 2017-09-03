module Webmanager
  class NewsletterReceiver < ApplicationRecord
    validates_presence_of :email
    validates_uniqueness_of :email, message: 'You have already subscribed!'
  end
end
