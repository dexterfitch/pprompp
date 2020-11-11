class Character < ApplicationRecord
  has_many :user_characters
  has_many :users, through: :prompts
end
