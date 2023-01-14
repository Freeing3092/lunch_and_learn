require 'rails_helper'

# a data attribute, under which all other attributes are present:

#     collection, each containing the following:
#         id, always set to null
#         type, always set to recipe
#         attributes, containing the following:
#             title
#             url
#             country used for search
#             image url


RSpec.describe RecipeService do
  describe 'class methods' do
    describe '#country_recipes' do
      it 'returns json of recipes for a provided country' do
        recipes = RecipeService.country_recipes('Cuba')

        expect(recipes[:hits]).to be_a Array
        expect(recipes[:hits][0][:recipe][:uri]).to be_a String
        expect(recipes[:hits][0][:recipe][:image]).to be_a String
        expect(recipes[:hits][0][:recipe][:label]).to be_a String
      end
    end
  end
end