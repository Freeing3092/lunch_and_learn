require 'rails_helper'

RSpec.describe 'Country Recipes Request' do
  it 'returns json of recipes for a provided country' do
    VCR.use_cassette('recipes_germany') do
      get '/api/v1/recipes?country=Germany'
    end

    expect(response).to be_successful

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes[:data][0]).to be_a Hash
    expect(recipes[:data][0][:id]).to eq('null')
    expect(recipes[:data][0][:type]).to eq('recipe')
    expect(recipes[:data][0][:attributes][:title]).to be_a String
    expect(recipes[:data][0][:attributes][:url]).to be_a String
    expect(recipes[:data][0][:attributes][:country]).to be_a String
    expect(recipes[:data][0][:attributes][:image]).to be_a String
    expect(recipes[:data][0][:attributes].keys.size).to eq(4)
  end
  
  it 'if a country is not provided, it returns recipes for a random country' do

    VCR.use_cassette('countries_all') do
      json_response = File.read('spec/fixtures/random_country.json')
      stub_request(:any, /edamam/).to_return(status: 200, body: json_response)
      get '/api/v1/recipes'
    end

    expect(response).to be_successful
  
    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes[:data][0]).to be_a Hash
    expect(recipes[:data][0][:id]).to eq('null')
    expect(recipes[:data][0][:type]).to eq('recipe')
    expect(recipes[:data][0][:attributes][:title]).to be_a String
    expect(recipes[:data][0][:attributes][:url]).to be_a String
    expect(recipes[:data][0][:attributes][:country]).to be_a String
    expect(recipes[:data][0][:attributes][:image]).to be_a String
    expect(recipes[:data][0][:attributes].keys.size).to eq(4)
  end
end