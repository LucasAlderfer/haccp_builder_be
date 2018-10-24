class Ingredient < ApplicationRecord
  validates_presence_of :id, :name, :receiving_from, :receiving_letter, :receiving_dna, :receiving_other, :receiving_hazard_bio, :receiving_hazard_chem, :receiving_hazard_phys, :receiving_hazard_handling, :storage_type, :storage_dna, :storage_other, :storage_hazard_bio, :storage_hazard_chem, :storage_hazard_phys, :storage_hazard_handling, :preparation_method, :preparation_dna, :preparation_other, :preparation_hazard_bio, :preparation_hazard_phys, :preparation_hazard_chem, :preparation_hazard_handling, :packaging_method, :packaging_dna, :packaging_other, :packaging_hazard_bio, :packaging_hazard_chem, :packaging_hazard_phys, :packaging_hazard_handling
  belongs_to :product
end
