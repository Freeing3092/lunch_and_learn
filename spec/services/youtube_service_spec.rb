require 'rails_helper'

RSpec.describe YoutubeService do
  describe 'class methods' do
    describe '#search_list' do
      it 'returns json of youtube search results from the Mr History channel
       matching the query' do
        VCR.use_cassette('youtube_canada') do
          search_list = YoutubeService.search_list('Canada')
  
          expect(search_list[:items]).to be_a Array
          expect(search_list[:items][0][:id][:videoId]).to be_a String
          expect(search_list[:items][0][:snippet][:title]).to be_a String
        end
      end
    end
  end
end