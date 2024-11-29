class AddBookToChats < ActiveRecord::Migration[7.0]
  def change
    add_reference :chats, :book, null: false, foreign_key: true
  end
end
