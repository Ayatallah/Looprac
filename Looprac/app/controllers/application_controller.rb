class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :banned?


  def banned?
  	if current_user.present? && current_user.banned?
  		flash[:alert] = 'This account has been suspended'
  		root_path
  		sign_out current_user
  		
  	end
  end



    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :first_name, :last_name, :gender) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
        end
end
