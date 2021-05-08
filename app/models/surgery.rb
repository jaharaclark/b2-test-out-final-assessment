class Surgery < ApplicationRecord
  has_many :doctors_surgeries 
  has_many :doctors, through: :doctors_surgeries

  def most_experienced
    doctors.where("years_practiced >?", 15)
  end

  def least_experienced
    doctors.where("years_practiced <?", 15)
  end

end