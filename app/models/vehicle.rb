class Vehicle < ApplicationRecord
  belongs_to :load
  has_many :routes
  belongs_to :driver, optional: true
end
