class Driver < ApplicationRecord
  belongs_to :vehicle, optional: true
  has_many :routes

  def full_name
    return "#{name} #{last_name}"
  end
end
