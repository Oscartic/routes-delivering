class Vehicle < ApplicationRecord
  belongs_to :load
  has_many :routes, dependent: :destroy
  belongs_to :driver, optional: true
end
