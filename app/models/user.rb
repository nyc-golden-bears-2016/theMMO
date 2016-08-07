class User < ApplicationRecord
  has_secure_password
  has_many :characters

  validates :username, length: {minimum: 5}, uniqueness: true
  validates :email, uniqueness: true
end
