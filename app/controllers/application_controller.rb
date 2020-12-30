class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def forbid_login_user
    if current_user != nil
      redirect_to schedules_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end
end