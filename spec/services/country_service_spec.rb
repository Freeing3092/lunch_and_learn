require 'rails_helper'

RSpec.describe CountryService do
  describe 'class methods' do
    describe '#countries' do
      it 'returns json of all countries' do
        countries = CountryService.countries

        expect(countries).to be_a Array
      end
    end
  end
end