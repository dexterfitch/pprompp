class CreateMotivations < ActiveRecord::Migration[5.2]
  def change
    create_table :motivations do |t|
      t.string :description
      t.string :notes

      t.timestamps
    end
  end
end
