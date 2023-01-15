require 'rails_helper'

RSpec.describe VideoFacade do
  describe 'class methods' do
    describe '#video' do
      it 'returns a single Video object for a given query' do
        VCR.use_cassette('youtube_canada') do
          video = VideoFacade.video('Canada')
  
          expect(video).to be_a Video
        end
      end
    end
  end
end