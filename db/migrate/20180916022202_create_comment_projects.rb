class CreateCommentProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
