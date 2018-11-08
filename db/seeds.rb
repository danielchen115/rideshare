# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  leave_time = Faker::Time.between(DateTime.now, DateTime.now + 7)
  ride = Ride.create(
  origin: Faker::Address.city,
  destination: Faker::Address.city,
  leave_at: leave_time,
  arrive_at: leave_time + 10800,
  price: Faker::Commerce.price,
  seats: Faker::Number.between(1,7),
  details: Faker::Lorem.paragraph
  )
  ride.bookings.create(user_id: User.first.id, ride_id: ride.id, role: 'driver', required_seats: 1)
end