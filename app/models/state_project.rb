class StateProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :notification
end
