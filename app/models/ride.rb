class Ride < ApplicationRecord
	validates_presence_of :origin, :destination, :leave_at, :arrive_at, :price, :seats
	has_many :bookings, inverse_of: :ride, dependent: :destroy
  has_many :users, through: :bookings
	accepts_nested_attributes_for :bookings
end
