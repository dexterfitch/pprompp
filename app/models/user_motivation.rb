class UserMotivation < ApplicationRecord
  belongs_to :user
  belongs_to :motivation
end
