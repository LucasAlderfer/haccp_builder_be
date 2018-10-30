require 'rails_helper'

describe 'GET /api/v1/companies' do
  it 'shows all companies' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    expected = [
                {
                  "id" => company.id,
                  "name" => company.name,
                  "email" => company.email,
                  "address" => company.address,
                  "phone" => company.phone,
                  "team_member_1_name" => company.team_member_1_name,
                  "team_member_1_title" => company.team_member_1_title,
                  "products" => []
                }
    ]
    get '/api/v1/companies'

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
  end
end

describe 'GET /api/v1/companies/:id' do
  it 'shows a company' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    product_1 = company.products.create!(name: 'burrito')
    product_2 = company.products.create!(name: 'sausage')
    ingredient_1 = product_1.ingredients.create!(name: 'meat', receiving_from: 'tom', inventory_type: 'frozen', processing_method: 'smashed', packaging_method: 'wrapped')
    ingredient_2 = product_1.ingredients.create!(name: 'cheese', receiving_from: 'ben', inventory_type: 'dry', processing_method: 'shredded', packaging_method: 'boxed')
    ingredient_3 = product_2.ingredients.create!(name: 'pig', receiving_from: 'farmer john', inventory_type: 'chilled', processing_method: 'ground', packaging_method: 'tubed')
    ingredient_4 = product_2.ingredients.create!(name: 'intestines', receiving_from: 'farmer bill', inventory_type: 'chilled', processing_method: 'sliced', packaging_method: 'boxed')
    expected =  {
                  "id" => company.id,
                  "name" => company.name,
                  "email" => company.email,
                  "address" => company.address,
                  "phone" => company.phone,
                  "team_member_1_name" => company.team_member_1_name,
                  "team_member_1_title" => company.team_member_1_title,
                  "products" => [
                      {
                        "company_id" => product_1.company_id,
                        "id" => product_1.id,
                        "name" => product_1.name,
                        "ingredients" => [
                          {
                            "product_id" => ingredient_1.product_id,
                            "id" => ingredient_1.id,
                            "name" => ingredient_1.name,
                            "receiving_from" => ingredient_1.receiving_from,
                            "receiving_letter" => ingredient_1.receiving_letter,
                            "receiving_dna" => ingredient_1.receiving_dna,
                            "receiving_other" => ingredient_1.receiving_other,
                            "receiving_hazard_bio" => ingredient_1.receiving_hazard_bio,
                            "receiving_hazard_chem" => ingredient_1.receiving_hazard_chem,
                            "receiving_hazard_phys" => ingredient_1.receiving_hazard_phys,
                            "receiving_hazard_handling" => ingredient_1.receiving_hazard_handling,
                            "inventory_type" => ingredient_1.inventory_type,
                            "inventory_dna" => ingredient_1.inventory_dna,
                            "inventory_other" => ingredient_1.inventory_other,
                            "inventory_hazard_bio" => ingredient_1.inventory_hazard_bio,
                            "inventory_hazard_chem" => ingredient_1.inventory_hazard_chem,
                            "inventory_hazard_phys" => ingredient_1.inventory_hazard_phys,
                            "inventory_hazard_handling" => ingredient_1.inventory_hazard_handling,
                            "processing_method" => ingredient_1.processing_method,
                            "processing_dna" => ingredient_1.processing_dna,
                            "processing_other" => ingredient_1.processing_other,
                            "processing_hazard_bio" => ingredient_1.processing_hazard_bio,
                            "processing_hazard_chem" => ingredient_1.processing_hazard_chem,
                            "processing_hazard_phys" => ingredient_1.processing_hazard_phys,
                            "processing_hazard_handling" => ingredient_1.processing_hazard_handling,
                            "packaging_method" => ingredient_1.packaging_method,
                            "packaging_dna" => ingredient_1.packaging_dna,
                            "packaging_other" => ingredient_1.packaging_other,
                            "packaging_hazard_bio" => ingredient_1.packaging_hazard_bio,
                            "packaging_hazard_chem" => ingredient_1.packaging_hazard_chem,
                            "packaging_hazard_phys" => ingredient_1.packaging_hazard_phys,
                            "packaging_hazard_handling" => ingredient_1.packaging_hazard_handling
                          },
                          {
                            "product_id" => ingredient_2.product_id,
                            "id" => ingredient_2.id,
                            "name" => ingredient_2.name,
                            "receiving_from" => ingredient_2.receiving_from,
                            "receiving_letter" => ingredient_2.receiving_letter,
                            "receiving_dna" => ingredient_2.receiving_dna,
                            "receiving_other" => ingredient_2.receiving_other,
                            "receiving_hazard_bio" => ingredient_2.receiving_hazard_bio,
                            "receiving_hazard_chem" => ingredient_2.receiving_hazard_chem,
                            "receiving_hazard_phys" => ingredient_2.receiving_hazard_phys,
                            "receiving_hazard_handling" => ingredient_2.receiving_hazard_handling,
                            "inventory_type" => ingredient_2.inventory_type,
                            "inventory_dna" => ingredient_2.inventory_dna,
                            "inventory_other" => ingredient_2.inventory_other,
                            "inventory_hazard_bio" => ingredient_2.inventory_hazard_bio,
                            "inventory_hazard_chem" => ingredient_2.inventory_hazard_chem,
                            "inventory_hazard_phys" => ingredient_2.inventory_hazard_phys,
                            "inventory_hazard_handling" => ingredient_2.inventory_hazard_handling,
                            "processing_method" => ingredient_2.processing_method,
                            "processing_dna" => ingredient_2.processing_dna,
                            "processing_other" => ingredient_2.processing_other,
                            "processing_hazard_bio" => ingredient_2.processing_hazard_bio,
                            "processing_hazard_chem" => ingredient_2.processing_hazard_chem,
                            "processing_hazard_phys" => ingredient_2.processing_hazard_phys,
                            "processing_hazard_handling" => ingredient_2.processing_hazard_handling,
                            "packaging_method" => ingredient_2.packaging_method,
                            "packaging_dna" => ingredient_2.packaging_dna,
                            "packaging_other" => ingredient_2.packaging_other,
                            "packaging_hazard_bio" => ingredient_2.packaging_hazard_bio,
                            "packaging_hazard_chem" => ingredient_2.packaging_hazard_chem,
                            "packaging_hazard_phys" => ingredient_2.packaging_hazard_phys,
                            "packaging_hazard_handling" => ingredient_2.packaging_hazard_handling
                          }
                          ]},
                          {
                            "company_id" => product_2.company_id,
                            "id" => product_2.id,
                            "name" => product_2.name,
                            "ingredients" => [
                              {
                                "product_id" => ingredient_3.product_id,
                                "id" => ingredient_3.id,
                                "name" => ingredient_3.name,
                                "receiving_from" => ingredient_3.receiving_from,
                                "receiving_letter" => ingredient_3.receiving_letter,
                                "receiving_dna" => ingredient_3.receiving_dna,
                                "receiving_other" => ingredient_3.receiving_other,
                                "receiving_hazard_bio" => ingredient_3.receiving_hazard_bio,
                                "receiving_hazard_chem" => ingredient_3.receiving_hazard_chem,
                                "receiving_hazard_phys" => ingredient_3.receiving_hazard_phys,
                                "receiving_hazard_handling" => ingredient_3.receiving_hazard_handling,
                                "inventory_type" => ingredient_3.inventory_type,
                                "inventory_dna" => ingredient_3.inventory_dna,
                                "inventory_other" => ingredient_3.inventory_other,
                                "inventory_hazard_bio" => ingredient_3.inventory_hazard_bio,
                                "inventory_hazard_chem" => ingredient_3.inventory_hazard_chem,
                                "inventory_hazard_phys" => ingredient_3.inventory_hazard_phys,
                                "inventory_hazard_handling" => ingredient_3.inventory_hazard_handling,
                                "processing_method" => ingredient_3.processing_method,
                                "processing_dna" => ingredient_3.processing_dna,
                                "processing_other" => ingredient_3.processing_other,
                                "processing_hazard_bio" => ingredient_3.processing_hazard_bio,
                                "processing_hazard_chem" => ingredient_3.processing_hazard_chem,
                                "processing_hazard_phys" => ingredient_3.processing_hazard_phys,
                                "processing_hazard_handling" => ingredient_3.processing_hazard_handling,
                                "packaging_method" => ingredient_3.packaging_method,
                                "packaging_dna" => ingredient_3.packaging_dna,
                                "packaging_other" => ingredient_3.packaging_other,
                                "packaging_hazard_bio" => ingredient_3.packaging_hazard_bio,
                                "packaging_hazard_chem" => ingredient_3.packaging_hazard_chem,
                                "packaging_hazard_phys" => ingredient_3.packaging_hazard_phys,
                                "packaging_hazard_handling" => ingredient_3.packaging_hazard_handling
                              },
                              {
                                "product_id" => ingredient_4.product_id,
                                "id" => ingredient_4.id,
                                "name" => ingredient_4.name,
                                "receiving_from" => ingredient_4.receiving_from,
                                "receiving_letter" => ingredient_4.receiving_letter,
                                "receiving_dna" => ingredient_4.receiving_dna,
                                "receiving_other" => ingredient_4.receiving_other,
                                "receiving_hazard_bio" => ingredient_4.receiving_hazard_bio,
                                "receiving_hazard_chem" => ingredient_4.receiving_hazard_chem,
                                "receiving_hazard_phys" => ingredient_4.receiving_hazard_phys,
                                "receiving_hazard_handling" => ingredient_4.receiving_hazard_handling,
                                "inventory_type" => ingredient_4.inventory_type,
                                "inventory_dna" => ingredient_4.inventory_dna,
                                "inventory_other" => ingredient_4.inventory_other,
                                "inventory_hazard_bio" => ingredient_4.inventory_hazard_bio,
                                "inventory_hazard_chem" => ingredient_4.inventory_hazard_chem,
                                "inventory_hazard_phys" => ingredient_4.inventory_hazard_phys,
                                "inventory_hazard_handling" => ingredient_4.inventory_hazard_handling,
                                "processing_method" => ingredient_4.processing_method,
                                "processing_dna" => ingredient_4.processing_dna,
                                "processing_other" => ingredient_4.processing_other,
                                "processing_hazard_bio" => ingredient_4.processing_hazard_bio,
                                "processing_hazard_chem" => ingredient_4.processing_hazard_chem,
                                "processing_hazard_phys" => ingredient_4.processing_hazard_phys,
                                "processing_hazard_handling" => ingredient_4.processing_hazard_handling,
                                "packaging_method" => ingredient_4.packaging_method,
                                "packaging_dna" => ingredient_4.packaging_dna,
                                "packaging_other" => ingredient_4.packaging_other,
                                "packaging_hazard_bio" => ingredient_4.packaging_hazard_bio,
                                "packaging_hazard_chem" => ingredient_4.packaging_hazard_chem,
                                "packaging_hazard_phys" => ingredient_4.packaging_hazard_phys,
                                "packaging_hazard_handling" => ingredient_4.packaging_hazard_handling
                              }
                              ]}
                  ]
                }
    get "/api/v1/companies/#{company.id}"
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
  end
end

describe 'POST /api/v1/companies' do
  it 'can post a company to the database' do
    expect(Company.all.count).to eq(0)
    company = {
                name: 'Turing',
                email: 'test@test.com',
                password: '12345',
                address: '12345 street way',
                phone: '1234567890',
                team_member_1_name: 'tom',
                team_member_1_title: 'President'
              }
    expected = { "id" => 1 }
    post "/api/v1/companies", params: {company: company}

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
    expect(Company.all.count).to eq(1)
  end

  it 'cannot post a company without all the right attributes' do
    expect(Company.all.count).to eq(0)
    company = {
                name: 'Turing',
                password: '12345',
              }
    post "/api/v1/companies", params: {company: company}
    expect(response.status).to eq(500)
    expect(Company.all.count).to eq(0)
  end
end

describe 'PUT /api/v1/companies/:id' do
  it 'can edit a company' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    new_company = {
                    name: 'Touring',
                    email: 'well@tested',
                    password: '12345',
                    address: 'A new Basement',
                    phone: '1234567890',
                    team_member_1_name: 'BEN',
                    team_member_1_title: 'Idea Box'
    }
    expected = {
                    "name" => 'Touring',
                    "email" => 'well@tested',
                    "id" => company.id,
                    "address" => 'A new Basement',
                    "phone" => '1234567890',
                    "products" => [],
                    "team_member_1_name" => 'BEN',
                    "team_member_1_title" => 'Idea Box'
    }
    put "/api/v1/companies/#{company.id}", params: {company: new_company}

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
  end
end
