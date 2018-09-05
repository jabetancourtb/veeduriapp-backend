class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :publication
    belongs_to :project
end
