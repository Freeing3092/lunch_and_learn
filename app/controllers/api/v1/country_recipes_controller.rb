class Api::V1::CountryRecipesController < ApplicationController
  def index
    if params[:country].nil?
      params[:country] = CountryFacade.random_country
    end
    country_recipes = RecipesFacade.country_recipes(params[:country])
    
    render json: RecipesSerializer.new(country_recipes).serializable_hash.to_json
  end
end