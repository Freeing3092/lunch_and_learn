class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.urlsafe_base64

    if user.save
      render json: UserSerializer.new(user), status: 201
    elsif User.find_by(email: user.email)
      render json: {error: 'A user with this email has already been registered'}.to_json, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end