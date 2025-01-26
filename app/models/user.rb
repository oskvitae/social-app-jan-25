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

  # events
  has_many :hosted_events, class_name: "Event", foreign_key: "host_id"
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event

  # Posts
  has_many :posts

  # Likes
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
end
