FactoryBot.define do
  factory :booking do
    role {'rider'}
    required_seats {Faker::Number.between(1,7)}
    association :user
    association :ride
  end
end