require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'class methods' do
    describe '#random_country' do
      it 'returns a random country' do
        VCR.use_cassette('countries_all') do
          country = CountryFacade.random_country
  
          expect(country).to be_a String
        end
      end
    end
  end
end