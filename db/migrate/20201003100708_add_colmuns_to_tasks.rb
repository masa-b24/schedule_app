class AddColmunsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :start_scheduled_time, :datetime
    add_column :tasks, :end_scheduled_time, :datetime
  end
end
