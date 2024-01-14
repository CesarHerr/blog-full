class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
  end
end
