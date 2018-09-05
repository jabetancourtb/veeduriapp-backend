class CreateCommentsProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_projects do |t|
      t.text :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :project, foreign_key: true
      t.timestamps
    end
  end
end
