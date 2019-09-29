class Load < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :routes, dependent: :destroy

end
