require 'rails_helper'

describe Ingredient, type: :model do
  context 'validations' do
    it {should validate_presence_of(:name)}
  end

  context 'relationships' do
    it {should belong_to(:product)}
  end
end
