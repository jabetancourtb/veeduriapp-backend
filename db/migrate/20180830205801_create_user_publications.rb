class CreateUserPublications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_publications do |t|
      t.string :state
      t.text :comment
      t.belongs_to :user, foreign_key: true
      t.belongs_to :publication, foreign_key: true
      t.timestamps
    end
  end
end
