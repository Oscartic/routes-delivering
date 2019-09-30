class Commune < ApplicationRecord
  has_many :services, dependent: :destroy

  def self.get_communes_ids(array)
    services = Service.where(id: array)
    communes = services.map{|service| service.commune_id}.uniq
    return communes
  end
end
