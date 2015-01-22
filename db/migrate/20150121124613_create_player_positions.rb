class CreatePlayerPositions < ActiveRecord::Migration
  def change
    create_table :player_positions do |t|
      t.integer :player_id
      t.decimal :latitude, precision: 15, scale: 10, default: 0.0
      t.decimal :longitude, precision: 15, scale: 10, default: 0.0

      t.timestamps
    end
  end
end
