class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :species
      t.string :race
      t.integer :age
      t.integer :average_lifespan
      t.string :physical_description
      t.string :notes

      t.timestamps
    end
  end
end
