class MessageComponent < ViewComponent::Base
  delegate :formatted_message_time, to: :helpers

  def initialize(message:, current_user:)
    @message = message
    @current_user = current_user
  end
end
