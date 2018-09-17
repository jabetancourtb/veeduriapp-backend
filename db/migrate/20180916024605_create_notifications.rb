class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :description
      t.integer :state
      t.belongs_to :user, foreign_key: true
      #t.belongs_to :project, foreign_key: true
      t.belongs_to :publication, foreign_key: true
      t.timestamps
    end
  end
end
