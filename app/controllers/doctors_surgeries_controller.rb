class DoctorsSurgeriesController < ApplicationController
  def create
    new_doctor = Doctor.find_by(name: params[:name])
    DoctorsSurgery.create!(surgery_id: params[:id], doctor_id: new_doctor.id)
    redirect_to "/surgeries/#{params[:id]}"
  end
end