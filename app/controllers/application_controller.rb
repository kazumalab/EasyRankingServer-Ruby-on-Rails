class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def confirmation_email!
    redirect_to root_url if !user_signed_in?
    redirect_to edit_user_registration_url if current_user.confirmed?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :provider, :uid, :image_url])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password, :image_url])
    end
end
