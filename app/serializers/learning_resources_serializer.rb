class LearningResourcesSerializer
  def self.serialize_resources(video, images, country)
    {
      data: {
        id: 'null',
        type: 'learning_resource',
        attributes: {
          country: country,
          video: {
            title: video.title,
            youtube_video_id: video.youtube_video_id
          },
          images: images.map do |image|
            {
              alt_tag: image.alt_tag,
              url: image.url
            }
          end
        }
      }
    }
  end

  def self.null_response(country)
    {
      data: {
        id: 'null',
        type: 'learning_resource',
        attributes: {
          country: country,
          video: {},
          images: []
        }
      }
    }
  end
end
