class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = policy_scope(Book)
  end

  def show
    authorize @book
  end

  def new
    @book = Book.new
    authorize @book
  end

  def create
    @book = Book.create(permitted_params)

    @book.user = current_user
    authorize @book
  
    if @book.save
      redirect_to my_books_books_path, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @book
  end

  def update
    authorize @book
  end

  def destroy
    authorize @book
  end

  def my_books
    @books = policy_scope(Book).where(user_id: current_user.id).order(created_at: :desc)
    authorize @books, policy_class: BookPolicy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def permitted_params
    params.require(:book).permit(:title, :author, :price)
  end
end
