require 'rails_helper'

describe 'POST /api/v1/products/:id/ingredients' do
  it 'can create an ingredient' do
    user = User.create!(email: 'test@test.com', password: '12345')
    company = user.companies.create!(id: 1, name: 'Turing', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    product_1 = company.products.create!(name: 'burrito')
    sign_in(user)
    ingredient = {
      "name" => "basil",
      "receiving_from" => "tommy",
      "receiving_letter" => false,
      "receiving_dna" => true,
      "receiving_other" => "ok, sure",
      "receiving_hazard_bio" => true,
      "receiving_hazard_chem" => false,
      "receiving_hazard_phys" => false,
      "receiving_hazard_handling" => "Wash It",
      "inventory_type" => "dry",
      "inventory_dna" => false,
      "inventory_other" => "N/A",
      "inventory_hazard_bio" => true,
      "inventory_hazard_chem" => false,
      "inventory_hazard_phys" => false,
      "inventory_hazard_handling" => "Be careful",
      "processing_method" => "Chop",
      "processing_dna" => false,
      "processing_other" => "None",
      "processing_hazard_bio" => false,
      "processing_hazard_chem" => false,
      "processing_hazard_phys" => false,
      "processing_hazard_handling" => "N/A",
      "packaging_method" => "boxes",
      "packaging_dna" => true,
      "packaging_other" => "Nothing",
      "packaging_hazard_bio" => false,
      "packaging_hazard_chem" => false,
      "packaging_hazard_phys" => false,
      "packaging_hazard_handling" => "Someone has to"
    }
    expect(product_1.ingredients.count).to eq(0)
    post "/api/v1/products/#{product_1.id}/ingredients", params: { ingredient: ingredient }

    expect(response.status).to eq(200)
    expect(response.body).to eq({id: 1}.to_json)
    expect(product_1.ingredients.count).to eq(1)
  end
  it 'cannot create an ingredient without required fields (name)' do
    user = User.create!(email: 'test@test.com', password: '12345')
    company = user.companies.create!(id: 1, name: 'Turing', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    product_1 = company.products.create!(name: 'burrito')
    sign_in(user)
    ingredient = {
      "receiving_from" => "tommy",
      "receiving_letter" => false,
      "receiving_dna" => true,
      "receiving_other" => "ok, sure",
      "receiving_hazard_bio" => true,
      "receiving_hazard_chem" => false,
      "receiving_hazard_phys" => false,
      "receiving_hazard_handling" => "Wash It",
      "inventory_type" => "dry",
      "inventory_dna" => false,
      "inventory_other" => "N/A",
      "inventory_hazard_bio" => true,
      "inventory_hazard_chem" => false,
      "inventory_hazard_phys" => false,
      "inventory_hazard_handling" => "Be careful",
      "processing_method" => "Chop",
      "processing_dna" => false,
      "processing_other" => "None",
      "processing_hazard_bio" => false,
      "processing_hazard_chem" => false,
      "processing_hazard_phys" => false,
      "processing_hazard_handling" => "N/A",
      "packaging_method" => "boxes",
      "packaging_dna" => true,
      "packaging_other" => "Nothing",
      "packaging_hazard_bio" => false,
      "packaging_hazard_chem" => false,
      "packaging_hazard_phys" => false,
      "packaging_hazard_handling" => "Someone has to"
    }
    expect(product_1.ingredients.count).to eq(0)
    post "/api/v1/products/#{product_1.id}/ingredients", params: { ingredient: ingredient }

    expect(response.status).to eq(500)
    expect(response.body).to eq({ error: "Unable to create ingredient"}.to_json)
    expect(product_1.ingredients.count).to eq(0)
  end
end

describe 'PUT /api/v1/ingredients/:id' do
  it 'can edit an ingredient' do
    user = User.create!(email: 'test@test.com', password: '12345')
    company = user.companies.create!(id: 1, name: 'Turing', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    product_1 = company.products.create!(name: 'burrito')
    ingredient_1 = product_1.ingredients.create!(name: 'meat', receiving_from: 'tom', inventory_type: 'frozen', processing_method: 'smashed', packaging_method: 'wrapped')
    sign_in(user)
    ingredient = {
      "name" => "basil",
      "receiving_from" => "tommy",
      "receiving_letter" => false,
      "receiving_dna" => true,
      "receiving_other" => "ok, sure",
      "receiving_hazard_bio" => true,
      "receiving_hazard_chem" => false,
      "receiving_hazard_phys" => false,
      "receiving_hazard_handling" => "Wash It",
      "inventory_type" => "dry",
      "inventory_dna" => false,
      "inventory_other" => "N/A",
      "inventory_hazard_bio" => true,
      "inventory_hazard_chem" => false,
      "inventory_hazard_phys" => false,
      "inventory_hazard_handling" => "Be careful",
      "processing_method" => "Chop",
      "processing_dna" => false,
      "processing_other" => "None",
      "processing_hazard_bio" => false,
      "processing_hazard_chem" => false,
      "processing_hazard_phys" => false,
      "processing_hazard_handling" => "N/A",
      "packaging_method" => "boxes",
      "packaging_dna" => true,
      "packaging_other" => "Nothing",
      "packaging_hazard_bio" => false,
      "packaging_hazard_chem" => false,
      "packaging_hazard_phys" => false,
      "packaging_hazard_handling" => "Someone has to"
    }
    expect(Ingredient.find(ingredient_1.id).name).to eq('meat')

    put "/api/v1/ingredients/#{ingredient_1.id}", params: { ingredient: ingredient }

    expect(response.status).to eq(200)
    expect(response.body).to eq({id: 1}.to_json)
    expect(Ingredient.find(ingredient_1.id).name).to eq('basil')
  end
end
