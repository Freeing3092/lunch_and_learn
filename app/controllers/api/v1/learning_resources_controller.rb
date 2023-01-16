class Api::V1::LearningResourcesController < ApplicationController
  def show
    video = VideoFacade.video(params[:country])
    images = ImagesFacade.images(params[:country])

    if video.nil? || images.nil?
      learning_resources = LearningResourcesSerializer.null_response(params[:country])
    else
      learning_resources = LearningResourcesSerializer.serialize_resources(video, images, params[:country])
    end
    render json: learning_resources.to_json
  end
end