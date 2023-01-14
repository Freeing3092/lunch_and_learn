class Recipe
  attr_reader :title,
              :url,
              :image_url,
              :country
  def initialize(recipe_data, country)
    @title = recipe_data[:recipe][:label]
    @url = recipe_data[:recipe][:uri]
    @image_url = recipe_data[:recipe][:image]
    @country = country
  end
end