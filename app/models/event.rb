class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :event_attendees, through: :attendances
  
  scope :future, -> { where('time >= ?', Time.now)}
  scope :past, -> { where('time < ?', Time.now )}
end
