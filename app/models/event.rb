class Event < ApplicationRecord
  has_many :creators, class_name: "User"
end
