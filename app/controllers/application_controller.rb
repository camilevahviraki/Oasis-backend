class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name email avatar password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name username email avatar password
                                               password_confirmation])
  end

  ##############################################################################

  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def decode_token
    # Authorization

    auth_header = request.headers['Authorization']
    return unless auth_header

    token = auth_header.split[1]
    begin
      JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def authorized_user
    decoded_token = decode_token
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorize
    render json: { message: 'Please log in' }, status: :unauthorized unless authorized_user
  end
end
