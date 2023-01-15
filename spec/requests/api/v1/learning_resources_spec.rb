require 'rails_helper'

RSpec.describe 'Learning Resources Request' do
  it 'returns serialized json including a video and images for a provided
  query' do
    VCR.use_cassette('youtube_canada') do
      VCR.use_cassette('images_canada') do
        get '/api/v1/learning_resources?country=Canada'
      end
    end
    
    expect(response).to be_successful

    learning_resources = JSON.parse(response.body, symbolize_names: true)

    expect(learning_resources[:data][:id]).to eq('null')
    expect(learning_resources[:data][:type]).to eq('learning_resource')
    expect(learning_resources[:data][:attributes][:country]).to eq('Canada')
    expect(learning_resources[:data][:attributes][:video][:title]).to be_a String
    expect(learning_resources[:data][:attributes][:video][:youtube_video_id]).to be_a String
    expect(learning_resources[:data][:attributes].keys.size).to eq(3)

    expect(learning_resources[:data][:attributes][:images]).to be_a Array
    expect(learning_resources[:data][:attributes][:images][0][:alt_tag]).to be_a String
    expect(learning_resources[:data][:attributes][:images][0][:url]).to be_a String
    expect(learning_resources[:data][:attributes][:images].size).to eq(10)
  end
end