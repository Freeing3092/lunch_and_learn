require 'rails_helper'

RSpec.describe RecipesFacade do
  describe 'class methods' do
    describe 'country_recipes' do
      it 'returns an array of Recipe objects for a given country' do
        VCR.use_cassette('recipes_germany') do
          recipes = RecipesFacade.country_recipes('Germany')
  
          recipes.each do |recipe|
            expect(recipe).to be_a Recipe
          end
        end
      end
    end
  end
end