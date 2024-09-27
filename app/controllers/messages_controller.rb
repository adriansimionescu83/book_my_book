# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is logged in
  before_action :set_chat
  after_action :verify_authorized    # Ensure Pundit authorization

  def create
    @message = @chat.messages.build(message_params)
    @message.user = current_user

    authorize @message  # Pundit: authorize this message

    if @message.save
      redirect_to @chat, notice: "Message sent successfully."
    else
      @messages = @chat.messages.order(created_at: :asc)
      render "chats/show"
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
    authorize @chat  # Pundit: ensure the user has access to the chat
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
