class Goal < ApplicationRecord
  has_many :users, through: :prompts

  validates :description, presence: true, length: { maximum: 60 }
end
