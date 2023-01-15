class Api::V1::LearningResourcesController < ApplicationController
  def show
    video = VideoFacade.video(params[:country])
    images = ImagesFacade.images(params[:country])

    learning_resources = LearningResourcesSerializer.serialize_resources(video, images, params[:country])

    render json: learning_resources.to_json
  end
end