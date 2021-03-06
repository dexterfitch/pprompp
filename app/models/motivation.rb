class Motivation < ApplicationRecord
  has_many :prompts
  has_many :users, through: :prompts

  validates :description, presence: true, length: { maximum: 60 }
end
