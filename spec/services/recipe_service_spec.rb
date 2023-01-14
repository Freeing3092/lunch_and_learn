require 'rails_helper'

RSpec.describe RecipeService do
  describe 'class methods' do
    describe '#country_recipes' do
      it 'returns json of recipes for a provided country' do
        VCR.use_cassette('recipes_germany') do
          recipes = RecipeService.country_recipes('Germany')

          expect(recipes[:hits]).to be_a Array
          expect(recipes[:hits][0][:recipe][:url]).to be_a String
          expect(recipes[:hits][0][:recipe][:image]).to be_a String
          expect(recipes[:hits][0][:recipe][:label]).to be_a String
        end
      end
    end
  end
end