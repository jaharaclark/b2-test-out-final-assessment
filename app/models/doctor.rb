class Doctor < ApplicationRecord
  has_many :doctors_surgeries 
  has_many :surgeries, through: :doctors_surgeries
end