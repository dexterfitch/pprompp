class Goal < ApplicationRecord
  has_many :users, through: :prompts

  validates :description, length: { maximum: 60 }
end
