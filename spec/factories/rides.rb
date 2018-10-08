FactoryBot.define do
  factory :ride do
    leave_time = Faker::Time.between(DateTime.now, DateTime.now + 7)
    origin {Faker::Address.city}
    destination {Faker::Address.city}
    leave_at {leaveDateTime}
    arrive_at {Faker::Time.between(leave_time, leave_time + 0.5)}
    price {Faker::Commerce.price}
    seats {Faker::Number.within(1..7)}
    details {Faker::Lorem.paragraph}
  end
end