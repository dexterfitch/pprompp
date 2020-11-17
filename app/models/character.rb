class Character < ApplicationRecord
  has_many :prompts
  has_many :users, through: :prompts

  validates :name, presence: true
  validates :species, presence: true
end
