require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should have_many :doctors_surgeries}
    it {should have_many(:surgeries).through(:doctors_surgeries)}
  end
end