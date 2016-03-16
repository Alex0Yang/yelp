class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: sign_in_params[:email]
    if user && user.authenticate(sign_in_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Sign in successfully"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You are signed out."
    redirect_to sign_in_path
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
