class CreatePrompts < ActiveRecord::Migration[5.2]
  def change
    create_table :prompts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :character, foreign_key: true
      t.belongs_to :goal, foreign_key: true
      t.belongs_to :motivation, foreign_key: true
      t.belongs_to :tactic, foreign_key: true
      t.string :notes
      t.string :url
      t.boolean :shared

      t.timestamps
    end
  end
end
