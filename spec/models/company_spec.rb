require 'rails_helper'

describe Company, type: :model do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end

  context 'relationships' do
    it {should have_many(:products)}
  end
end
