class Service < ApplicationRecord
  belongs_to :commune
  belongs_to :load
  belongs_to :route, optional: true

  def self.assigned_route_to_services(services, route)
    search_service = Service.where(id: services)
    search_service.map { |service| service.update(route: route) }
  end
end
