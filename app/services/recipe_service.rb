class RecipeService
  def self.country_recipes(country)
    response = conn.get('/api/recipes/v2') do |req|
      req.params['q'] = country
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |faraday|
      faraday.params['app_id'] = ENV['edamam_app_id']
      faraday.params['app_key'] = ENV['edamam_api_key']
      faraday.params['type'] = 'public'
    end
  end
end