class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_filter :authenticate_user!

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:warning] = exception.message
  #   redirect_to root_pat
  #   helper_method :current_user

  # before_filter :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end


  # to change name of user
  # def current_ability
  #   @current_ability ||= Ability.new(current_user)
  # end

 protected

 def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :dob,:email,:password, :password_confirmation, :gender, :image])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :dob,:email,:password, :password_confirmation)
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  # devise_parameter_sanitizer.for(:account_update) << :name

  added_attrs = [:name, :email, :password, :dob, :gender, :password_confirmation, :image, :avatar, :role]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 end



 private

# def current_user
#   User.new(session[:id])
# end


end
# end
