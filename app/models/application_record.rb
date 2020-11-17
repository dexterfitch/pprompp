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

  def self.my_prompt_objects(current_user, class_name)
    my_prompt_objects = []
    classified = Object.const_get class_name
    current_user.created_prompts.each do |created_prompt|
      my_prompt_objects << classified.find(created_prompt.send(class_name.downcase + '_id'))
    end
    my_prompt_objects.uniq
  end
end
