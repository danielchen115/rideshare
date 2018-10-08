class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_and_belongs_to_many :rides
end
