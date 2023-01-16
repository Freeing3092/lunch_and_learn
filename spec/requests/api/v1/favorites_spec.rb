require 'rails_helper'

RSpec.describe 'Favorties Endpoint' do

  describe 'post to favorites' do
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

  describe 'get favorites' do
    it "returns json of a user's favorites when a valid api_key is provided" do
      user = User.create!(name: "Athena Dao", email: "athenadao@bestgirlever.com", api_key: "jgn983hy48thw9begh98h4539h4")
      favorite1 = Favorite.create!(user_id: user.id, country: 'thailand', recipe_link: "https://www.tastingtable.com", recipe_title: "Crab Fried Rice (Khaao Pad Bpu)")
      favorite2 = Favorite.create!(user_id: user.id, country: 'poland', recipe_link: "https://www.polishrecipes.com", recipe_title: "Cheese and Sauerkraut Pierogis")

      get '/api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4'

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      favorites = JSON.parse(response.body, symbolize_names:true)

      expect(favorites[:data]).to be_a Array
      expect(favorites[:data].size).to eq(2)
      expect(favorites[:data][0]).to be_a Hash
      expect(favorites[:data][0].keys.size).to eq(3)
      expect(favorites[:data][0][:id]).to eq(favorite1.id.to_s)
      expect(favorites[:data][0][:type]).to eq('favorite')
      expect(favorites[:data][0][:attributes][:recipe_title]).to eq(favorite1.recipe_title)
      expect(favorites[:data][0][:attributes][:recipe_link]).to eq(favorite1.recipe_link)
      expect(favorites[:data][0][:attributes][:country]).to eq(favorite1.country)
      expect(favorites[:data][0][:attributes][:created_at]).to eq(favorite1.created_at.as_json)
      expect(favorites[:data][0][:attributes].keys.size).to eq(4)
    end

    it "returns a 404 status and helpful error message when an invalid api_key
    is provided" do
      user = User.create!(name: "Athena Dao", email: "athenadao@bestgirlever.com", api_key: "jgn983hy48thw9begh98h4539h4")
      favorite1 = Favorite.create!(user_id: user.id, country: 'thailand', recipe_link: "https://www.tastingtable.com", recipe_title: "Crab Fried Rice (Khaao Pad Bpu)")
      favorite2 = Favorite.create!(user_id: user.id, country: 'poland', recipe_link: "https://www.polishrecipes.com", recipe_title: "Cheese and Sauerkraut Pierogis")

      get '/api/v1/favorites?api_key=ajniel12354'

      expect(response).to have_http_status(404)

      favorites = JSON.parse(response.body, symbolize_names:true)
      expect(favorites).to eq({error: 'No user found with the provided api_key'})
    end
  end
end