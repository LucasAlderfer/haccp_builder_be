require 'rails_helper'

describe Ingredient, type: :model do
  context 'validations' do
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:receiving_from)}
    it {should validate_presence_of(:receiving_letter)}
    it {should validate_presence_of(:receiving_dna)}
    it {should validate_presence_of(:receiving_other)}
    it {should validate_presence_of(:receiving_hazard_chem)}
    it {should validate_presence_of(:receiving_hazard_phys)}
    it {should validate_presence_of(:receiving_hazard_bio)}
    it {should validate_presence_of(:receiving_hazard_handling)}
    it {should validate_presence_of(:storage_type)}
    it {should validate_presence_of(:storage_dna)}
    it {should validate_presence_of(:storage_other)}
    it {should validate_presence_of(:storage_hazard_chem)}
    it {should validate_presence_of(:storage_hazard_phys)}
    it {should validate_presence_of(:storage_hazard_bio)}
    it {should validate_presence_of(:storage_hazard_handling)}
    it {should validate_presence_of(:preparation_method)}
    it {should validate_presence_of(:preparation_dna)}
    it {should validate_presence_of(:preparation_other)}
    it {should validate_presence_of(:preparation_hazard_chem)}
    it {should validate_presence_of(:preparation_hazard_phys)}
    it {should validate_presence_of(:preparation_hazard_bio)}
    it {should validate_presence_of(:preparation_hazard_handling)}
    it {should validate_presence_of(:packaging_method)}
    it {should validate_presence_of(:packaging_dna)}
    it {should validate_presence_of(:packaging_other)}
    it {should validate_presence_of(:packaging_hazard_chem)}
    it {should validate_presence_of(:packaging_hazard_phys)}
    it {should validate_presence_of(:packaging_hazard_bio)}
    it {should validate_presence_of(:packaging_hazard_handling)}
  end

  context 'relationships' do
    it {should belong_to(:product)}
  end
end
