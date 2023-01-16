require 'rails_helper'

RSpec.describe 'Favorties Endpoint' do
  it 'adds a record to the favorites table and returns json indicating that record
  has been created when the user provides a valid api key' do
    user = User.create!(name: "Athena Dao", email: "athenadao@bestgirlever.com", api_key: "jgn983hy48thw9begh98h4539h4")
    request_body = {
      api_key: "jgn983hy48thw9begh98h4539h4",
      country: "thailand",
      recipe_link: "https://www.tastingtable.com",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
  }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/favorites', headers: headers, params: request_body.to_json

    expect(response).to have_http_status(201)

    favorite_json = JSON.parse(response.body, symbolize_names: true)

    expect(favorite_json).to eq({success: "Favorite added successfully"})
  end

  it 'returns a 404 error and a useful message if the api_key provided does not
  match any users in the database' do
    user = User.create!(name: "Athena Dao", email: "athenadao@bestgirlever.com", api_key: "jgn983hy48thw9begh98h4539h4")
    request_body = {
      api_key: "bvaregads4573",
      country: "thailand",
      recipe_link: "https://www.tastingtable.com",
      recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
  }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/favorites', headers: headers, params: request_body.to_json

    expect(response).to have_http_status(404)

    favorite_json = JSON.parse(response.body, symbolize_names: true)

    expect(favorite_json).to eq({error: 'No user found with the provided api_key'})
  end
end