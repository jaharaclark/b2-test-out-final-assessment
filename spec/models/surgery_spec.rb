require 'rails_helper'

RSpec.describe Surgery, type: :model do
  before :each do
    @meredith_grey = Doctor.create!(name: "Meredith Grey", years_practiced: 17, university: "UW")
    @alex_karev = Doctor.create!(name: "Alex Karev", years_practiced: 14, university: "University of Boston")
    @miranda_bailey = Doctor.create!(name: "Miranda Bailey", years_practiced: 28, university: "Harvard")
    @c_section = Surgery.create(title: "Caesarean Section", day_of_week: "Monday", operating_room_number: 1)
    @bowel_reconstruction = @meredith_grey.surgeries.create!(title: "Bowel Reconstruction", day_of_week: "Tuesday", operating_room_number: 2)
    @record_one = DoctorsSurgery.create!(doctor_id: @meredith_grey.id, surgery_id: @c_section.id)
    @record_two = DoctorsSurgery.create!(doctor_id: @alex_karev.id, surgery_id: @c_section.id)
  end

  describe 'relationships' do
    it {should have_many :doctors_surgeries}
    it {should have_many(:doctors).through(:doctors_surgeries)}
  end

  describe 'instance methods' do
    describe '#most_experienced' do
      it 'returns doctors with 15 or more years experience' do
        expect(@c_section.most_experienced).to eq([@meredith_grey])
      end
    end
    
    describe '#least_experienced' do
      it 'returns doctors with less than 15 years experience' do
        expect(@c_section.least_experienced).to eq([@alex_karev])
      end
    end
  end
end