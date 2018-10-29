require 'rails_helper'

describe 'POST /api/v1/companies/:id/products' do
  it 'can post a product to the database' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    expect(Product.all.count).to eq(0)
    product = {
                name: 'Developers'
              }
    expected = { "id" => 1 }
    post "/api/v1/companies/#{company.id}/products", params: {product: product}

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
    expect(Product.all.count).to eq(1)
    expect(company.products.all.count).to eq(1)
  end
end

describe 'PUT /api/v1/companies/:id/products/:product_id' do
  it 'can edit a product in the database' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
    product = company.products.create!(name: 'Developers')
    new_product = {
                name: 'Developering'
              }
    expected = {
                 "id" => product.id,
                 "name" => 'Developering'
               }

    expect(company.products.first.name).to eq('Developers')

    put "/api/v1/companies/#{company.id}/products/#{product.id}", params: {product: new_product}

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq(expected)
    expect(company.products.all.count).to eq(1)
    expect(company.products.first.name).to eq('Developering')
  end
end
