class ChangeDatesInEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :webmanager_events, :start_date, :date
    change_column :webmanager_events, :end_date, :date
  end
end
