class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :posts
  has_many :event_attendances
  has_many :events, through: :event_attendances
  has_many :follower_relationships, class_name: "Follow", foreign_key: "source_id"
  has_many :follower_relationships, class_name: "Follow", foreign_key: "target_id"

  # Interests
  has_many :user_interests
  has_many :interests, through: :user_interests
end
