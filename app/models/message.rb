# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  # def broadcast_message
  #   rendered_message = ApplicationController.render(
  #     template: "messages/_message",
  #     assigns: { message: self },
  #     layout: false
  #   )
  
  #   # Broadcast the rendered HTML
  #   broadcast_append_to(
  #     "chat_#{chat.id}_messages",
  #     target: "messages",
  #     html: rendered_message
  #   )
  # end

  def broadcast_message
    broadcast_append_to "chat_#{chat.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, current_user: self.user }
  end
end

