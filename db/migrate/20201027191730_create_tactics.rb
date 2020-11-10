class CreateTactics < ActiveRecord::Migration[5.2]
  def change
    create_table :tactics do |t|
      t.string :description
      t.string :notes
      t.boolean :shared

      t.timestamps
    end
  end
end
