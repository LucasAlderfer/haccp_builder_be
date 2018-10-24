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
                  "team_member_1_title" => company.team_member_1_title
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
    expected =  {
                  "id" => company.id,
                  "name" => company.name,
                  "email" => company.email,
                  "address" => company.address,
                  "phone" => company.phone,
                  "team_member_1_name" => company.team_member_1_name,
                  "team_member_1_title" => company.team_member_1_title
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
end
