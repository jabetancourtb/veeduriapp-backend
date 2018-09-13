class AddCoverToProjects < ActiveRecord::Migration[5.2]
  def change
    add_attachment :projects, :cover
  end
end
