class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", render_message(message)
      head :ok
    else
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    # This will render the _message partial as HTML
    ApplicationController.render(partial: "messages/message", locals: { message: message })
  end
end
