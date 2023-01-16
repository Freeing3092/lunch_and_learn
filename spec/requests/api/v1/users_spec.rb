require 'rails_helper'

RSpec.describe 'Users Endpoint' do
  it 'returns json reponse when a post request is sent with a name and
  a unique email' do
    request_body = {
      name: "Athena Dao",
      email: "athenadao@bestgirlever.com"
    }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: request_body.to_json

    expect(response).to have_http_status(201)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:data][:type]).to eq('user')
    expect(user_response[:data][:id]).to be_a String
    expect(user_response[:data][:attributes][:name]).to eq(request_body[:name])
    expect(user_response[:data][:attributes][:email]).to eq(request_body[:email])
    expect(user_response[:data][:attributes][:api_key]).to be_a String
  end

  it 'returns an error and 400 status code if the email already exists' do
    User.create!(name: 'Athena Dao', email: "athenadao@bestgirlever.com", api_key: SecureRandom.urlsafe_base64)

    request_body = {
      name: "Athena Dao",
      email: "athenadao@bestgirlever.com"
    }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    post '/api/v1/users', headers: headers, params: request_body.to_json

    expect(response).to have_http_status(400)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:error]).to eq('A user with this email has already been registered')
  end
end