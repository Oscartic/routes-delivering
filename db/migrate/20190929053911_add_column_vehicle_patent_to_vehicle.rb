class AddColumnVehiclePatentToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :vehicle_patent, :string
  end
end
