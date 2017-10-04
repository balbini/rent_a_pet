class MessagesController < ApplicationController
# In the create method you’ll see ActionCable.server.broadcast. This is responsible for broadcasting the created message. We use the chatroom_id param to make the broadcast unique ie: “messages_2”, “messages_3”, etc. On the show page for a specific chat you will be streaming from “messages_2”, “messages_3”, etc depending on the chat you’re viewing.

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      #broadcasting out to messages channel including the chatroom_id so messages are broadcasted to specific chat only
      ActionCable.server.broadcast( "messages_#{message_params[:chatroom_id]}",
      #message and user hold the data we render on the page using javascript
      message: message.content,
      user: message.user.email
      )
    else
      redirect_to chatrooms_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end
