class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_many :bookings, inverse_of: :user, dependent: :destroy
  has_many :rides, through: :bookings
  accepts_nested_attributes_for :bookings
end
