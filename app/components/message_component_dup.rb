# frozen_string_literal: true

class MessageComponentDup < ViewComponent::Base
  delegate :formatted_message_time, to: :helpers

  def initialize(message:)
    @message = message
  end
end
