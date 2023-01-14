class CountryFacade
  def self.random_country
    countries_json = CountryService.countries

    countries = countries_json.each_with_object([]) do |data, countries|
      countries << data[:name][:official]
    end
    countries.sample
  end
end