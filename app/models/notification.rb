class Notification < ApplicationRecord
    belongs_to :users
    belongs_to :publications
    belongs_to :projects
end
