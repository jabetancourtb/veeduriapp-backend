class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.string :state
      t.text :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true
      t.timestamps
    end
  end
end
