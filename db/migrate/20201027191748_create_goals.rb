class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :description
      t.string :notes
      t.boolean :shared

      t.timestamps
    end
  end
end
