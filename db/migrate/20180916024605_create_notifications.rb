class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :description
      t.integer :state
      t.string :id_p
      t.string :url_p
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
