require 'rails_helper'

describe 'GET /api/v1/companies?company_email=:email&company_password=:password' do
  it 'can get company information by email' do
    company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')

    expected = {
      "id" => company.id,
      "name" => company.name
    }

    get "/api/v1/company?company_email=#{company.email}&company_password=#{company.password}"

    expect(response.status).to eq(200)
    expect(response.body).to eq(expected.to_json)
  end
end
