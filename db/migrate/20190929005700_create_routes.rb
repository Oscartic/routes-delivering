class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :load, foreign_key: true
      t.float :load_sum
      t.integer :int_array, :array => true, :default => '{}'
      t.integer :stops_amount
      t.integer :vehicle_id, null: true
      t.integer :driver_id, null: true
      t.boolean :is_completed

      t.timestamps
    end
  end
end
