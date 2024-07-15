class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @books = Book.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
