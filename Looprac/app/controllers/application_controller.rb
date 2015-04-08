class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound do 
  	flash[:warning] = 'Resource not found'
  	redirect_back_or root_path
  end

  def redirect_back_or(path)
  	redirect_to request.referer || path
  end
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :banned?


  def banned?
  	if current_user.present? && current_user.banned?
  		flash[:alert] = 'This account has been suspended'
      sign_out current_user
  		root_path
  	end
  end





    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :gender, :email, :password) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :current_password, :gender, :age, :car_model, :facebook, :twitter, :googleplus) }
        end
end
