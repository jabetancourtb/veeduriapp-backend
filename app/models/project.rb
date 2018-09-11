class Project < ApplicationRecord
    has_many :user, :through => :user_project
    validates :title, presence: true
    validates :information, presence: true, length: { minimum: 20 }
    validates :description, presence: true
end
