class RemoveColumnsFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :start_scheduled_time, :time
    remove_column :tasks, :end_scheduled_time, :time
  end
end
