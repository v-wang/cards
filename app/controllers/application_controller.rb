class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    # devise_parameter_sanitizer.for(:edit) << :name
  end

  def after_sign_in_path_for(resource)
  	project_path(resource.projects.last)
  end

  def after_sign_up_path_for(resource)
  	project_path(resource.projects.first)
  end
end
