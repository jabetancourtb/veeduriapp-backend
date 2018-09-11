class CreateStatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :state_publications do |t|
      t.references :user, foreign_key: true
      t.references :publication, foreign_key: true
      t.text :comment
      t.string :state

      t.timestamps
    end
  end
end
