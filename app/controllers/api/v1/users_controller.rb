class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.urlsafe_base64
    user.save

    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end