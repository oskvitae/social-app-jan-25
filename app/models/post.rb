class Post < ApplicationRecord
  belongs_to :user
  validates :caption, length: { maximum: 200 }

  has_many :likes
  has_many :liking_users, through: :likes, source: :user
end
