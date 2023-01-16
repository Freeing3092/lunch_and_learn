class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {error: 'No user found with the provided api_key'}, status: 404
    else
      favorite = Favorite.new(favorites_params)
      favorite.user_id = user.id
      favorite.save
      render json: {success: "Favorite added successfully"}.to_json, status: 201
    end
  end

  private

  def favorites_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end