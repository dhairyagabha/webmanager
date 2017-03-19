class AddBooleansNewsletterReceiver < ActiveRecord::Migration[5.0]
  def change
    add_column :webmanager_newsletter_receivers, :event_notification, :boolean
  end
end
