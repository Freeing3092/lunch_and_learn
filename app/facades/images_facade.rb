class ImagesFacade
  def self.images(query)
    images_json = FlickrService.images(query)

    photos = images_json[:photos][:photo]
    photos.first(10).map do |photo_data|
      Image.new(photo_data)
    end
  end
end