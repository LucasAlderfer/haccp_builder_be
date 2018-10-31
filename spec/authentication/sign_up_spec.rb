require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'test@test.com',
        password: '12345'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(new_user[:email]).to eq('test@test.com')
    end
  end

  context 'when user already exists' do
    before do
      User.create!(email: 'test@test.com', password: '12345')
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
