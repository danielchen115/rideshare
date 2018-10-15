class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_many :bookings, dependent: :destroy
  has_many :rides, through: :bookings
end
