class CreateUserGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_goals do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :goal, foreign_key: true
    end
  end
end
