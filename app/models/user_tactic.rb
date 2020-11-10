class UserTactic < ApplicationRecord
  belongs_to :user
  belongs_to :tactic
end
