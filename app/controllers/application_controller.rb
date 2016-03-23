class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method  :current_user

  def current_user
    @user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def authenticate
    unless current_user
      flash[:danger] = "You need to sign in."
      redirect_to sign_in_path
      return
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
