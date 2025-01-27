# app/controllers/chats_controller.rb
class ChatsController < ApplicationController
  before_action :authenticate_user!  # Devise ensures the user is logged in
 
  def create
    book = Book.find(params[:book_id]) # Assuming there's a Book model
    book_owner = book.user             # The user who owns the book
    buyer = current_user               # The user who clicked "Proceed to Buy"

    # Find or create a chat between this book owner and buyer
    @chat = Chat.find_or_create_by(book_owner: book_owner, buyer: buyer, book: book)
    authorize @chat

    redirect_to @chat
  end

  def index
    @chats = policy_scope(Chat)

    @pagy, @chats = pagy(@chats)
  end

  def show
    @chat = Chat.find(params[:id])

    # Pundit: authorize the access to this chat
    authorize @chat
  end

end
