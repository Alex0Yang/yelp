class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Sign up successfully"
      redirect_to root_path
    else
      flash.now[:danger] = "Something wrong!"
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
