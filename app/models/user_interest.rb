class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest

  validates :rating, numericality: { in: 1..10 }
end
