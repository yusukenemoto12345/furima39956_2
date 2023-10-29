class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
authenticate_or_request_with_http_basic do |username, password|
 username == 'adomin' && password == '2222'
 end
  end

  def configure_permitted_parameters
devise_parameter_sanitizer.permit(:sign_up,
keys: [:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_katakana, :last_name_katakana,:date_of_birth])
  end
end
