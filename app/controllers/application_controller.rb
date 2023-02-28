class ApplicationController < ActionController::Base
    ##this before_action is needed to customize the default settings for devise and allow for username
    ##see registration controller for additional things that were changed
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        added_attrs = [:email, :username, :password, :password_confirmation, :remember_me]
        #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
        #devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      end
end
