class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :load, foreign_key: true
      t.integer :driver_id, null: true
      t.float :capacity, null: false

      t.timestamps
    end
  end
end
