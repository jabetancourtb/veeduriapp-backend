class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notification
  has_many :project, :through => :user_project
  
  has_many :publication
  has_many :user_publication
  #has_many :publications, :through => :user_publications
  # validates :name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
end
