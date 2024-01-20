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

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'User updated'
    else
      flash[:alert] = 'User not updated'
    end
    redirect_to edit_user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :bio, :photo, :country)
  end
end
