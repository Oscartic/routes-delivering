class Service < ApplicationRecord
  belongs_to :commune
  belongs_to :load
  belongs_to :route, optional: true
end
