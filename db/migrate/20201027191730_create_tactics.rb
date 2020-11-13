class CreateTactics < ActiveRecord::Migration[5.2]
  def change
    create_table :tactics do |t|
      t.integer :user_id, foreign_key: true, optional: true
      t.string :description
      t.string :notes
      t.boolean :shared

      t.timestamps
    end
  end
end
