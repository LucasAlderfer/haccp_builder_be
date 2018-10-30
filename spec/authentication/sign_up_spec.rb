require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      company: {
        name: 'Billy',
        address: '12345 street way',
        phone: '1234567890',
        team_member_1_name: 'tom',
        team_member_1_title: 'President',
        email: 'test@test.com',
        password: '12345'
      }
    }
  end

  context 'when buyer is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new buyer' do
      new_buyer = JSON.parse(response.body, symbolize_names: true)

      expect(new_buyer[:name]).to eq('Billy')
      expect(new_buyer[:address]).to eq('12345 street way')
      expect(new_buyer[:phone]).to eq('1234567890')
      expect(new_buyer[:team_member_1_name]).to eq('tom')
      expect(new_buyer[:team_member_1_title]).to eq('President')
      expect(new_buyer[:email]).to eq('test@test.com')
    end
  end

  context 'when buyer already exists' do
    before do
      company = Company.create!(id: 1, name: 'Turing', email: 'test@test.com', password: '12345', address: '12345 street way', phone: '1234567890', team_member_1_name: 'tom', team_member_1_title: 'President')
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      validation_errors = JSON.parse(response.body, symbolize_names: true)
      expect(validation_errors[:errors].first[:title]).to eq('Bad Request')
    end
  end
end
