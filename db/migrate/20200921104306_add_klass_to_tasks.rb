class AddKlassToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :klass, :integer, default: 0
  end
end
