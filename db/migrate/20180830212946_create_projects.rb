class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title # title of the project to be shown
      t.text :information # All information of the project to be shown

      t.string :name # name id of the project
      t.text :description # Little description for the project with keywords

      t.string :photo
      t.timestamps
    end
  end
end
