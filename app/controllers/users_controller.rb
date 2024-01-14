class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

    return unless @user.nil?

    flash[:alert] = 'User not found'
    redirect_to users_path
  end
end
