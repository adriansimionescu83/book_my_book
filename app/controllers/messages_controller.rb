# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is logged in
  after_action :verify_authorized    # Ensure Pundit authorization

  def create
    @chat = Chat.find(params[:chat_id])
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

  def message_params
    params.require(:message).permit(:content)
  end
end
