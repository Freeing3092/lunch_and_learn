class Image 
  attr_reader :alt_tag,
              :url
  def initialize(image_data)
    @alt_tag = image_data[:title]
    @url = image_data[:url_l]
  end
end