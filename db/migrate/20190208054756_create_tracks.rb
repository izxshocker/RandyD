class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :player, foreign_key: true
      t.integer :x
      t.integer :z
      t.integer :xMax
      t.integer :zMax
      t.integer :xMin
      t.integer :zMin
      t.integer :xP
      t.integer :zP
      t.integer :xN
      t.integer :zN
      t.integer :zMaxN
      t.integer :zMaxN
      t.integer :xMinN
      t.integer :zMinN
      t.integer :xPN
      t.integer :zPN
      t.boolean :raided
      t.string :notes

      t.timestamps
    end
  end
end
