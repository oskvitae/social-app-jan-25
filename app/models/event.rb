class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :user
end
