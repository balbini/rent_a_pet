# Here we will define our channel to inherit from the ApplicationCable::Channel class that we described earlier on.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:chatroom_id]}"
  end
end

# Our Messages Channel needs only one method for our purposes, the #subscribed method. This method is responsible for subscribing to and streaming messages that are broadcast to this channel.
