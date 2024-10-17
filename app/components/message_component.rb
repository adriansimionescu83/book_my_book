# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  delegate :current_user, :formatted_message_time, to: :helpers
  def initialize(message:)
    @message = message
  end
end
