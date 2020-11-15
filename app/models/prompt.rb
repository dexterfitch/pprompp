class Prompt < ApplicationRecord
  belongs_to :user
  belongs_to :character
  belongs_to :goal
  belongs_to :motivation
  belongs_to :tactic
  accepts_nested_attributes_for :character, reject_if: lambda { |attributes| attributes['name'].blank? || attributes['species'].blank? }
end

