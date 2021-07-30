class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :skip_devise?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :is_club_admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :is_club_admin])
  end

  def skip_devise?
    params[:controller] =~ /(^pages$)/
  end
end
