require 'rails_helper'

RSpec.describe 'Country Recipes Request' do
  it 'returns json of recipes for a provided country' do
    get '/api/v1/recipes?country=germany'

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