class ChangeDateTimeToTimeStartsAtColumnRoutes < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :routes, :starts_at, :time,  null: false
    end

    def down
      change_column :routes, :starts_at, :datetime,  null: false
    end
  end
end
