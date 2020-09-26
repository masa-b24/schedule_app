class RenameScheduledTimeColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :scheduled_time, :start_scheduled_time
  end
end
