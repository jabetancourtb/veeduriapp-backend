class Publication < ApplicationRecord
    belongs_to :user
    has_many :user_publication
    #has_many :users, :through => :user_publications
    validates :title, presence: true
    validates :information, presence: true, length: { minimum: 20 }
    validates :description, presence: true
end
