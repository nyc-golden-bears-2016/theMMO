class User < ApplicationRecord
  has_secure_password

  validates :username, length: {minimum: 5}, uniqueness: true
  validates :email, uniqueness: true
end
