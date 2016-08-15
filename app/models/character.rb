class Character < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, uniqueness: true
  belongs_to :party, required: false
end
