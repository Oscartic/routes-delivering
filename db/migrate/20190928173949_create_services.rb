class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :type_service
      t.string :address
      t.float :weight
      t.references :commune, foreign_key: true
      t.references :load_type, foreign_key: true
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
