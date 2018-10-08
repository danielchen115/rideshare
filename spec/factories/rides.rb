# spec/factories/rides.rb

FactoryBot.define do
  factory :ride do
    leave_time = Faker::Time.between(DateTime.now, DateTime.now + 7)
    origin {Faker::Address.city}
    destination {Faker::Address.city}
    leave_at {leave_time}
    arrive_at {leave_time + 10800}
    price {Faker::Commerce.price}
    seats {Faker::Number.between(1,7)}
    details {Faker::Lorem.paragraph}
  end
end