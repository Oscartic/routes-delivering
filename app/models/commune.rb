class Commune < ApplicationRecord
  has_many :services, dependent: :destroy
end
