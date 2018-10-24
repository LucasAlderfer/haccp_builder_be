require 'rails_helper'

describe Product, type: :model do
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
  end

  context 'relationships' do
    it {should belong_to(:company)}
    it {should have_many(:ingredients)}
  end
end
