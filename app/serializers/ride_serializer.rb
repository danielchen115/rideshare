class RideSerializer < ActiveModel::Serializer
  attributes :id, :origin, :destination, :leave_at, :arrive_at, :price, :seats
end
