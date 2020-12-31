class AddEndScheduledTimeToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :end_scheduled_time, :time
  end
end
