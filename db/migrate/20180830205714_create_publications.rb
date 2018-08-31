class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :description
      t.text :information
      t.string :photo
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
