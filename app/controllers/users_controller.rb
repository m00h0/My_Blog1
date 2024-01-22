class UsersController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts.includes(:comments) if @user
  end

  def show
    @user = User.find(params[:id]) # find user by id
    @recent_posts = @user.most_recent_posts(3)
  end
end
