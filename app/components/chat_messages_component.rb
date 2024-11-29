# frozen_string_literal: true

class ChatMessagesComponent < ViewComponent::Base
  delegate :current_user, :formatted_last_seen, to: :helpers

  def initialize(chat:)
    @chat = chat
    @messages = @chat.messages.order(created_at: :asc)
  end

end
