require 'rails_helper'

RSpec.describe FlickrService do
  describe 'class methods' do
    describe '#images' do
      it 'returns image json related to the provided query' do
        VCR.use_cassette('images_canada') do
          images = FlickrService.images('Canada')
          expect(images).to be_a Hash
          expect(images[:photos][:photo]).to be_a Array
          expect(images[:photos][:photo][0][:title]).to be_a String
          expect(images[:photos][:photo][0][:url_l]).to be_a String
        end
      end
    end
  end
end