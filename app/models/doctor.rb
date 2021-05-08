class Doctor < ApplicationRecord
  has_many :doctors_surgeries 
  has_many :surgeries, through: :doctors_surgeries

  def self.order_by_tenure
    order(years_practiced: :desc)
  end
end