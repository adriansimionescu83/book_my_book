# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    # Identify all the users associated with the chat
    users = [chat.book_owner, chat.buyer]
    # For each user broadcast the new component
    users.each do |user|
      broadcast_append_to "chat_#{chat.id}_#{user.id}_messages", target: "messages",
                          partial: "messages/message",
                          locals: { message: self, current_user: user }
    end
  end
  
end

