class UserPublication < ApplicationRecord
    belongs_to :users
    belongs_to :publications
end
