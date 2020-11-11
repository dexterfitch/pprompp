class Motivation < ApplicationRecord
  has_many :user_motivations
  has_many :users, through: :prompts
end
