class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :danger, :info, :warning

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :phone, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
