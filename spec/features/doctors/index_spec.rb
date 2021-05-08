require 'rails_helper'

RSpec.describe Doctor, type: :feature do
  before :each do
    @meredith_grey = Doctor.create!(name: "Meredith Grey", years_practiced: 17, university: "UW")
    @alex_karev = Doctor.create!(name: "Alex Karev", years_practiced: 14, university: "University of Boston")
    @miranda_bailey = Doctor.create!(name: "Miranda Bailey", years_practiced: 28, university: "Harvard")
    @c_section = @alex_karev.surgeries.create(title: "Caesarean Section", day_of_week: "Monday", operating_room_number: 1)
    @bowl_reconstruction = @meredith_grey.surgeries.create!(title: "Bowl Reconstruction", day_of_week: "Tuesday", operating_room_number: 2)
  end

  describe "User Story One" do
    it "When I visit the Doctor index
    Then I see the all Doctors including their name, years practiced, and university
    And I see that the doctors are listed in order of years practiced from most to least" do
      visit "/doctors"
      expect(page).to have_content(@meredith_grey.name)
      expect(page).to have_content(@meredith_grey.years_practiced)
      expect(page).to have_content(@meredith_grey.university)
      expect(page).to have_content(@alex_karev.name)
      expect(page).to have_content(@alex_karev.years_practiced)
      expect(page).to have_content(@alex_karev.university)
      expect(page).to have_content(@miranda_bailey.name)
      expect(page).to have_content(@miranda_bailey.years_practiced)
      expect(page).to have_content(@miranda_bailey.university)
    end
  end

end