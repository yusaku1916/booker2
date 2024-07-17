class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      # render :index
      # @errors_count = @book.errors.count
      flash[:error] = { messages: @book.errors.full_messages, count: @book.errors.count }
      # { count: errors_count, messages: @book.errors.full_messages }
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    # @book = Book.where(id: params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book.id)
    else
      # flash[:error] = { messages: book.errors.full_messages, count: book.errors.count }
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
