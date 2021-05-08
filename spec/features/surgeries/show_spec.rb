require 'rails_helper'

RSpec.describe Doctor, type: :feature do
  before :each do
    @meredith_grey = Doctor.create!(name: "Meredith Grey", years_practiced: 17, university: "UW")
    @alex_karev = Doctor.create!(name: "Alex Karev", years_practiced: 14, university: "University of Boston")
    @miranda_bailey = Doctor.create!(name: "Miranda Bailey", years_practiced: 28, university: "Harvard")
    @c_section = Surgery.create(title: "Caesarean Section", day_of_week: "Monday", operating_room_number: 1)
    @bowel_reconstruction = @meredith_grey.surgeries.create!(title: "Bowel Reconstruction", day_of_week: "Tuesday", operating_room_number: 2)
    @record_one = DoctorsSurgery.create!(doctor_id: @meredith_grey.id, surgery_id: @c_section.id)
    @record_two = DoctorsSurgery.create!(doctor_id: @alex_karev.id, surgery_id: @c_section.id)
  end
  
  describe "User Story Two" do
    it "When I visit a surgerys show page
    Then I see the surgerys title, day of the week, and operating room number
    And I see the names and years practiced of all doctors performing this surgery
    And I see two sections, one for 'Most experienced doctor' and one for 'Least experienced doctor'
    And in those two sections I see the two doctors who are performing this surgery with the most and least years practiced 
    in the appropriate section including their name and their years practiced." do
      visit "/surgeries/#{@c_section.id}"
      expect(page).to have_content(@c_section.title)
      expect(page).to have_content(@c_section.day_of_week)
      expect(page).to have_content(@c_section.operating_room_number)
      within("#most_experienced") do
        expect(page).to have_content(@meredith_grey.name)
        expect(page).to have_content(@meredith_grey.years_practiced)
      end
      within("#least_experienced") do
        expect(page).to have_content(@alex_karev.name)
        expect(page).to have_content(@alex_karev.years_practiced)
      end
    end
  end

  describe "User Story Three" do
    it "When I visit a surgery's show page
    I see a field with instructions to Add A Doctor To This Surgery
    When I input the name of an existing Doctor into that field
    And I click submit
    I'm taken back to that surgery's show page
    And I see the name of that doctor listed on the page" do
      visit "/surgeries/#{@c_section.id}"
      expect(page).to have_content("Add A Doctor To This Surgery")
      fill_in :name, with: "Miranda Bailey"
      click_on("Submit")
      expect(current_path).to eq("/surgeries/#{@c_section.id}")
      expect(page).to have_content(@miranda_bailey.name)
    end
  end
end

