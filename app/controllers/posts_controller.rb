class PostsController < ApplicationController
  before_action :signed_in_user

def show
 @post = Post.find(params[:id])
end

def new
 @post = Post.new
end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

private
    def post_params
      params.require(:post).permit(:itemname, :itemdescription, :category_id)
    end
end
