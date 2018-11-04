require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:ride) }
  it { should validate_presence_of(:role)}
  it { should validate_presence_of(:required_seats)}
  it { should validate_presence_of(:user)}
  it { should validate_presence_of(:ride)}
end
