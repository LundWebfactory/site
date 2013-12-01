class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params) 
    if @user.save
      sign_in @user
      flash[:success] = "You are now signed in!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
