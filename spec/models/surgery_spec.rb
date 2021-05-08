require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
    it {should have_many :doctors_surgeries}
    it {should have_many(:doctors).through(:doctors_surgeries)}
  end
end