class Motivation < ApplicationRecord
  has_many :users, through: :prompts
end
