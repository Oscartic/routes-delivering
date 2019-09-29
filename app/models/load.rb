class Load < ApplicationRecord
  has_many :services
  has_many :vehicles
  has_many :routes
end
