class VideoFacade
  def self.video(query)
    videos_json = YoutubeService.search_list(query)

    if videos_json[:items].empty?
      nil
    else
      Video.new(videos_json[:items].first)
    end
  end
end