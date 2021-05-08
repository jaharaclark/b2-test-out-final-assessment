require 'rails_helper'

RSpec.describe Doctor, type: :feature do
  before :each do
    @meredith_grey = Doctor.create!(name: "Meredith Grey", years_practiced: 17, university: "UW")
    @alex_karev = Doctor.create!(name: "Alex Karev", years_practiced: 14, university: "University of Boston")
    @miranda_bailey = Doctor.create!(name: "Miranda Bailey", years_practiced: 28, university: "Harvard")
    @c_section = Surgery.create(title: "Caesarean Section", day_of_week: "Monday", operating_room_number: 1)
    @bowl_reconstruction = @meredith_grey.surgeries.create!(title: "Bowl Reconstruction", day_of_week: "Tuesday", operating_room_number: 2)
    @record = DoctorsSurgery.create!(doctor_id: @meredith_grey.id, surgery:)
  end
  
  describe "User Story Two" do
    it "When I visit a surgerys show page
    Then I see the surgerys title, day of the week, and operating room number
    And I see the names and years practiced of all doctors performing this surgery
    And I see two sections, one for 'Most experienced doctor' and one for 'Least experienced doctor'
    And in those two sections I see the two doctors who are performing this surgery with the most and least years practiced 
    in the appropriate section including thier name and their years practiced." do
      visit "/surgeries/#{@c_section.id}"
      expect(page).to have_content(@c_section.title)
      expect(page).to have_content(@c_section.day_of_week)
      expect(page).to have_content(@c_section.operating_room_number)
    end
  end