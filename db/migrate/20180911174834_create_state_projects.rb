class CreateStateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :state_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.text :comment
      t.string :state

      t.timestamps
    end
  end
end
