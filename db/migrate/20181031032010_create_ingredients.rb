class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.references :product
      t.string :receiving_from, default: ''
      t.boolean :receiving_letter, default: false
      t.boolean :receiving_dna, default: false
      t.string :receiving_other, default: ''
      t.boolean :receiving_hazard_bio, default: false
      t.boolean :receiving_hazard_phys, default: false
      t.boolean :receiving_hazard_chem, default: false
      t.string :receiving_hazard_handling, default: ''
      t.string :inventory_type, default: ''
      t.boolean :inventory_dna, default: false
      t.string :inventory_other, default: ''
      t.boolean :inventory_hazard_bio, default: false
      t.boolean :inventory_hazard_phys, default: false
      t.boolean :inventory_hazard_chem, default: false
      t.string :inventory_hazard_handling, default: ''
      t.string :processing_method, default: ''
      t.boolean :processing_dna, default: false
      t.string :processing_other, default: ''
      t.boolean :processing_hazard_bio, default: false
      t.boolean :processing_hazard_phys, default: false
      t.boolean :processing_hazard_chem, default: false
      t.string :processing_hazard_handling, default: ''
      t.string :packaging_method, default: ''
      t.boolean :packaging_dna, default: false
      t.string :packaging_other, default: ''
      t.boolean :packaging_hazard_bio, default: false
      t.boolean :packaging_hazard_phys, default: false
      t.boolean :packaging_hazard_chem, default: false
      t.string :packaging_hazard_handling, default: ''
    end
  end
end
