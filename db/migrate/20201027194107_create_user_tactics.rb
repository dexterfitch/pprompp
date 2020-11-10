class CreateUserTactics < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tactics do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tactic, foreign_key: true
    end
  end
end
