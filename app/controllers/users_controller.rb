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
  end
end
