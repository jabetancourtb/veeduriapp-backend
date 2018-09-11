class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :type
      t.text :description
      t.string :state
      t.belongs_to :state_publication, foreign_key: true
      t.belongs_to :state_project, foreign_key: true
      t.timestamps
    end
  end
end
