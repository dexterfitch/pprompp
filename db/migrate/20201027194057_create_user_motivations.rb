class CreateUserMotivations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_motivations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :motivation, foreign_key: true
    end
  end
end
