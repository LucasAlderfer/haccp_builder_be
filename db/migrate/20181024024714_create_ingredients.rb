class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :product
      t.string :receiving_from
      t.boolean :receiving_letter, default: false
      t.boolean :receiving_dna, default: false
      t.string :receiving_other, default: ''
      t.boolean :receiving_hazard_bio, default: false
      t.boolean :receiving_hazard_phys, default: false
      t.boolean :receiving_hazard_chem, default: false
      t.string :receiving_hazard_handling, default: ''
      t.string :storage_type
      t.boolean :storage_dna, default: false
      t.string :storage_other, default: ''
      t.boolean :storage_hazard_bio, default: false
      t.boolean :storage_hazard_phys, default: false
      t.boolean :storage_hazard_chem, default: false
      t.string :storage_hazard_handling, default: ''
      t.string :preparation_method
      t.boolean :preparation_dna, default: false
      t.string :preparation_other, default: ''
      t.boolean :preparation_hazard_bio, default: false
      t.boolean :preparation_hazard_phys, default: false
      t.boolean :preparation_hazard_chem, default: false
      t.string :preparation_hazard_handling, default: ''
      t.string :packaging_method
      t.boolean :packaging_dna, default: false
      t.string :packaging_other, default: ''
      t.boolean :packaging_hazard_bio, default: false
      t.boolean :packaging_hazard_phys, default: false
      t.boolean :packaging_hazard_chem, default: false
      t.string :packaging_hazard_handling, default: ''
    end
  end
end
