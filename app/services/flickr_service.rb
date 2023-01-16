class FlickrService
  def self.conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.params['api_key'] = ENV['flickr_api_key']
      faraday.params['format'] = 'json'
    end
  end

  def self.images(query)
    response = conn.get('/services/rest') do |req|
      req.params['text'] = query
      req.params['method'] = 'flickr.photos.search'
      req.params['extras'] = 'url_l'
    end
    response.body.delete_prefix!('jsonFlickrApi(')
    response.body.chop!
    JSON.parse(response.body, symbolize_names: true)
  end
end