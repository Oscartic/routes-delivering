class Service < ApplicationRecord
  belongs_to :commune
  belongs_to :load_type
  belongs_to :route
end
