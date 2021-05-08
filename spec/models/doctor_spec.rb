require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before :each do
    @meredith_grey = Doctor.create!(name: "Meredith Grey", years_practiced: 17, university: "UW")
    @alex_karev = Doctor.create!(name: "Alex Karev", years_practiced: 14, university: "University of Boston")
    @miranda_bailey = Doctor.create!(name: "Miranda Bailey", years_practiced: 28, university: "Harvard")
    @c_section = @alex_karev.surgeries.create(title: "Caesarean Section", day_of_week: "Monday", operating_room_number: 1)
    @bowl_reconstruction = @meredith_grey.surgeries.create!(title: "Bowl Reconstruction", day_of_week: "Tuesday", operating_room_number: 2)
  end

  describe 'relationships' do
    it {should have_many :doctors_surgeries}
    it {should have_many(:surgeries).through(:doctors_surgeries)}
  end

  describe 'class methods' do
    describe '#order_by_tenure' do
      it 'orders doctors from most to least tenure' do
        expect(Doctor.order_by_tenure).to eq([@miranda_bailey, @meredith_grey, @alex_karev])
      end
    end
  end

end