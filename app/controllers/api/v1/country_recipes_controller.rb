class Api::V1::CountryRecipesController < ApplicationController
  def index
    country_recipes = RecipesFacade.country_recipes(params[:country])
    
    render json: RecipesSerializer.new(country_recipes).serializable_hash.to_json
    # require 'pry'; binding.pry
  end
end