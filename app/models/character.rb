class Character < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: true
  belongs_to :party, required: false
end
