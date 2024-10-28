# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    # Identify the other user
    other_user = user == chat.book_owner ? chat.buyer : chat.book_owner    

    rendered_message = ApplicationController.render(
      template: "messages/show",
      assigns: { message: self, current_user: self.user },
      layout: false
    )
  
    # Broadcast the rendered HTML
    broadcast_append_to(
      "chat_#{chat.id}_#{other_user.id}_messages",
      target: "messages",
      html: rendered_message
    )
  end
end

