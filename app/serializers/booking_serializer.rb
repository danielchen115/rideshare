class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ride_id, :role, :required_seats
  belongs_to :ride
end
