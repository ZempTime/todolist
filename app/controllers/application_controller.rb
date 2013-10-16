class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to root_url, alert: "You must be signed in" if !session[:user_id].present?
  end
  
  def user_signed_in?
    !!current_user
  end
  helper_method :user_signed_in?

  def current_user
    @user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
