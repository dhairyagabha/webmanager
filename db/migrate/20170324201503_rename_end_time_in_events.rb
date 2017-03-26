class RenameEndTimeInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :webmanager_events, :end_time, :end_date
  end
end
