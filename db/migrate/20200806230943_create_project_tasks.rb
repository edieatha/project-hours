class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.index :project_id
      t.index :task_id

      t.timestamps
    end
  end
end
