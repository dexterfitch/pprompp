class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :shared, -> { where(shared: true) }
end
