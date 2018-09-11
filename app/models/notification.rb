class Notification < ApplicationRecord
    belongs_to :state_project
    belongs_to :state_publication
end
