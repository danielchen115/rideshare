require 'rails_helper'

RSpec.describe Ride, type: :model do
  it { should have_many(:bookings).dependent(:destroy) }
  it { should have_many(:users).through(:bookings) }
  it { should validate_presence_of(:origin)}
  it { should validate_presence_of(:destination)}
  it { should validate_presence_of(:leave_at)}
  it { should validate_presence_of(:arrive_at)}
  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:seats)}

end
