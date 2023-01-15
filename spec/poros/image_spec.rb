require 'rails_helper'

RSpec.describe Image do
  describe 'initialize' do
    it 'has readable attributes' do
      image_data = {
        :title=>"Gas Works Park 2023 01 03 23",
        :url_l=>"https://live.staticflickr.com/65535/52629234541_7e36c1c630_b.jpg"
      }
      image = Image.new(image_data)

      expect(image.alt_tag).to eq(image_data[:title])
      expect(image.url).to eq(image_data[:url_l])
    end
  end
end