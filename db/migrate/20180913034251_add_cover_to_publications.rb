class AddCoverToPublications < ActiveRecord::Migration[5.2]
  def change
    add_attachment :publications, :cover
  end
end
