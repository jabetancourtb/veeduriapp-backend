class Project < ApplicationRecord
    belongs_to :user
    has_many :state_project
    validates :title, presence: true
    validates :information, presence: true, length: { minimum: 20 }
    validates :description, presence: true

    
    before_create :set_visits_count

    def update_visits_count
        self.update(visits_count: self.visits_count + 1)
    end

    private

    def set_visits_count
        self.visits_count ||= 0
    end
end
