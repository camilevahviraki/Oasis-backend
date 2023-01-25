class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    protected

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :avatar, :password, :password_confirmation ])
       devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :avatar, :password, :password_confirmation])
    end

end
