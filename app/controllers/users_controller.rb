class UsersController < ApplicationController
before_action :signed_in_user, only: [:edit, :update]
before_action :correct_user,   only: [:edit, :update]
before_action :admin_user,     only: :destroy

  def index
    redirect_to(root_url) unless current_user.admin?
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
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

    def toggle_admin
      @user = User.find(params[:id])  
      @user.toggle!(:admin)  
      redirect_to users_path
    end  

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
