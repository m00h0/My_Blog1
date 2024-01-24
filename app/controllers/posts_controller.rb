class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, :comments).where(author_id: @user)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.includes(:author, :comments, :likes).find_by(author_id: @user, id: params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
