class Publication < ApplicationRecord
    belongs_to :users
    has_many :user_publications
    #has_many :users, :through => :user_publications
    validates :title, presence: true
    validates :information, presence: true
    validates :description, presence: true
end
