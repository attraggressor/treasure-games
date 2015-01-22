class CreateTreasurePositions < ActiveRecord::Migration
  def change
    create_table :treasure_positions do |t|
      t.decimal :latitude, precision: 15, scale: 10, default: 0.0
      t.decimal :longitude, precision: 15, scale: 10, default: 0.0
      t.boolean :active

      t.timestamps
    end
  end
end
