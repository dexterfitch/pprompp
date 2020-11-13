class Tactic < ApplicationRecord
  has_many :users, through: :prompts
end
