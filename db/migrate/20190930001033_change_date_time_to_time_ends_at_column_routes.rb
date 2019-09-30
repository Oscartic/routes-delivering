class ChangeDateTimeToTimeEndsAtColumnRoutes < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :routes, :ends_at, :time,  null: false
    end

    def down
      change_column :routes, :ends_at, :datetime,  null: false
    end
  end
end
