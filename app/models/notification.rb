class Notification < ApplicationRecord
    belongs_to :state_project
    belongs_to :state_publication
    belongs_to :comment_project
    belongs_to :comment_publication
end
