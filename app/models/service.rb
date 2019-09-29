class Service < ApplicationRecord
  belongs_to :commune
  belongs_to :load
  belongs_to :route, optional: true

  def self.route_and_services_is_a_equal_load(services, load)
    search_service = Service.where(id: services)
    values = search_service.map{|item| item.load_id === load}
    if values === load
      return true
    else
      return false
    end
  end

  def self.assigned_route_to_services(services, route)
    search_service = Service.where(id: services)
    search_service.map { |service| service.update(route: route) }
  end
end
