require 'rails_helper'

RSpec.describe ImagesFacade do
  describe 'class methods' do
    describe '#images' do
      it 'returns an array of image objects for the proviced query' do
        VCR.use_cassette('images_canada') do
          images = ImagesFacade.images('Canada')
          images.each do |image|
            expect(image).to be_a Image
          end

          expect(images.size).to eq(10)
        end
      end
    end
  end
end