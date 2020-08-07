class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :task_hours
      t.index :creator_id

      t.timestamps
    end
  end
end
