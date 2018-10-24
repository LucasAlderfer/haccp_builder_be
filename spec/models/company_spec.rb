require 'rails_helper'

describe Company, type: :model do
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:team_member_1_name)}
    it {should validate_presence_of(:team_member_1_title)}
  end

  context 'relationships' do
    it {should have_many(:products)}
  end
end
