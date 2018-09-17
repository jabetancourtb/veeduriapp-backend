class Notification < ApplicationRecord
    belongs_to :user
    #belongs_to :project
    belongs_to :publication
end
