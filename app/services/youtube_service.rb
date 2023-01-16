class YoutubeService
  def self.conn
    Faraday.new('https://www.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['google_api_key']
    end
  end
    
  def self.search_list(query)
    response = conn.get('/youtube/v3/search') do |req|
      req.params['part'] = 'snippet'
      req.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      req.params['q'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end