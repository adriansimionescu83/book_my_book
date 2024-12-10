class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = policy_scope(Book)

    # Exclude the owner's books if the user is signed in
    @books = @books.where.not(user_id: current_user.id) if user_signed_in?

    # Apply the search query if present, maintaining other conditions
    if params[:query].present?
      @books = @books.merge(Book.global_search(params[:query]))
    end
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

    if @book.update(permitted_params)
      redirect_to my_books_books_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
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
    params.require(:book).permit(:title, :author, :description, :category_id, :language_id, :price, :status, :photo)
  end
end
