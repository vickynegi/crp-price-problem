class V1::LoginController < ApplicationController
  protect_from_forgery with: :null_session
  # skip_before_action :auth_request!

  ## User will sign in
  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: JsonWebToken.generate_token(user_id: @user.id), first_name: @user.first_name, last_name: @user.last_name }, status: :ok
    else
      render json: { error: 'Unauthorized attempt' }, status: :unauthorized
    end
  end
end
