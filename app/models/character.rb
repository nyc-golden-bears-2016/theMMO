class Character < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, uniqueness: true, length: {minimum: 3, maximum: 10}
  belongs_to :party, required: false
end
