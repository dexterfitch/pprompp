class Tactic < ApplicationRecord
  has_many :user_tactics
  has_many :users, through: :prompts
end
