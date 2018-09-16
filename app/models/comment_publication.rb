class CommentPublication < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  has_many :notification
end
