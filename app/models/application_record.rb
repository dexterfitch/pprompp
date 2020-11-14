class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :shared, -> { where(shared: true) }

  def self.randomize(class_name)
    class_name = Object.const_get class_name
    class_name.order("RANDOM()")
  end

  def self.available(current_user)
    shared.or(where(user_id: current_user.id))
  end
end
