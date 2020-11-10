class Prompt < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :goal
  belongs_to :motivation
  belongs_to :tactic
end
