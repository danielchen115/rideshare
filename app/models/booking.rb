class Booking < ApplicationRecord
  validates_presence_of :user, :ride, :role, :required_seats
  belongs_to :user
  belongs_to :ride
end
