require 'rails_helper'

RSpec.describe Video do
  describe 'initialize' do
    it 'has readable attributes' do
      video_data = {
        id: {
            videoId: "nJf62pMnjHA"
        },
        snippet: {
            title: "A Super Quick History of Peru"
        }
      }

      video = Video.new(video_data)

      expect(video.title).to eq(video_data[:snippet][:title]) 
      expect(video.youtube_video_id).to eq(video_data[:id][:videoId]) 
    end
  end
end