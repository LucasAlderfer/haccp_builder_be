require 'rails_helper'

describe Ingredient, type: :model do
  context 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:receiving_from)}
    it {should validate_presence_of(:storage_type)}
    it {should validate_presence_of(:preparation_method)}
    it {should validate_presence_of(:packaging_method)}
  end

  context 'relationships' do
    it {should belong_to(:product)}
  end
end
