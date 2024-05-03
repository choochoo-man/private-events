class Attendance < ApplicationRecord
  belongs_to :attended_event_id, class_name: "Event"
  belongs_to :event_attendee_id, class_name: "User"
end
