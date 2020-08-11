class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_icon
      t.integer :user_id

      t.timestamps
    end
  end
end
