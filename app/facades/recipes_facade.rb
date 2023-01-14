class RecipesFacade
  def self.country_recipes(country)
    parsed_json = RecipeService.country_recipes(country)

    parsed_json[:hits].map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end
end