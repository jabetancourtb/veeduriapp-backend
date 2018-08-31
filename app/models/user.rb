class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications
  has_many :projects, :through => :user_projects
  
  has_many :publications
  has_many :user_publication
  #has_many :publications, :through => :user_publications
  # validates :name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
end
