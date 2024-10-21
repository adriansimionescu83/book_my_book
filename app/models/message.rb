# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  validates :content, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    # Render the MessageComponent into a string
    rendered_message = ApplicationController.render(
      MessageComponent.new(message: self),
      layout: false
    )

    # Now you can broadcast this rendered component
    broadcast_append_to(
      "chat_#{chat.id}_messages",
      target: "messages",
      html: rendered_message)

  end
end

