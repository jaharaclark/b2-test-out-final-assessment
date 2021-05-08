class Surgery < ApplicationRecord
  has_many :doctors_surgeries 
  has_many :doctors, through: :doctors_surgeries
end