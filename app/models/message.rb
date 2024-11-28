# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    # Identify the other user, the message receiver
    receiving_user = user == chat.book_owner ? chat.buyer : chat.book_owner

    broadcast_append_to "chat_#{chat.id}_#{receiving_user.id}_messages", target: "messages",
                        partial: "messages/message",
                        locals: { message: self, current_user: receiving_user }
  end
  
end

