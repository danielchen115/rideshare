class RideSerializer < ActiveModel::Serializer
  attributes :id, :origin, :destination, :leave_at, :arrive_at, :price, :seats, :details, :created_at, :updated_at
  has_many :bookings
end
