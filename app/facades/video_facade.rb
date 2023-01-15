class VideoFacade
  def self.video(query)
    videos_json = YoutubeService.search_list(query)

    Video.new(videos_json[:items].first)
  end
end