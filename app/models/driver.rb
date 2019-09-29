class Driver < ApplicationRecord
  belongs_to :vehicle, optional: true
  has_many :routes, dependent: :destroy

  def full_name
    return "#{name} #{last_name}"
  end

  def self.assign_vehicle_to_driver(driver, vehicle)
    if driver.present? && vehicle.present? && driver.vehicle.nil? && vehicle.driver.nil?
      driver.update(vehicle: vehicle)
      vehicle.update(driver: driver)
     end
  end
end
