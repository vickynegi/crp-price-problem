class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token
	before_action :auth_request!
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	private

	def auth_request!
		token = request.env['HTTP_AUTHORIZATION'] || params[:jwt_token]

	  render( json: { error: 'Missing Authorization token' }, status: 422) && return unless token

	  jwt_payload = JsonWebToken.decode_token(token)

	  if (jwt_payload.class == Array && jwt_payload[0] == 400)
	  	 @current_user = false
	  else
			@current_user = User.find_by(id: jwt_payload['user_id'])
		end

		render json: { error: 'Not Authenticated' }, status: 401 unless @current_user
	end

	# Setting current user
  def current_user
    @current_user
  end

  def record_not_found
    render json: { message: 'not_found' }, status: :not_found
  end
end
