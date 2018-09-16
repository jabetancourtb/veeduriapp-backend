class CreateCommentPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_publications do |t|
      t.references :user, foreign_key: true
      t.references :publication, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
