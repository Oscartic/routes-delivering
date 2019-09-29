class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :vehicle_id, null: true

      t.timestamps
    end
  end
end
