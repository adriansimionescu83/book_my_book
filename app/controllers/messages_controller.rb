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
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages,
            target: "messages",
            html: render_to_string(MessageComponent.new(message: @message, current_user: current_user)))
        end
        format.html { redirect_to @chat }
      end

    else
      @messages = @chat.messages.order(created_at: :asc)
      render "chats/show"
    end
  end

  def show
    byebug
    @message = Message.find(params[:id])
    authorize @message  # Pundit: authorize this message

    # Render the message component manually with current_user as an argument
    @message_component = MessageComponent.new(message: @message, current_user: current_user)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end