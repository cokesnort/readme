class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sanitazer = devise_parameter_sanitizer.for(:sign_up)
    sanitazer << :first_name
    sanitazer << :last_name
  end
end
