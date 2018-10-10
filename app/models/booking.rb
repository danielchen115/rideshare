class Booking < ApplicationRecord
  validates_presence_of :user_id, :ride_id, :type, :required_seats
  belongs_to :ride
  belongs_to :user
end
