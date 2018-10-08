class Ride < ApplicationRecord
	validates_presence_of :origin, :destination, :leave_at, :arrive_at, :price, :seats
	has_and_belongs_to_many :users
end
