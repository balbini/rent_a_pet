//  createMessagesChannel() function --> this is being referenced from the /chatrooms/show.html.erb. This is a function so the server only listens and broadcast when you are looking at a chat versus always running the the background. This method created the subscription to the corresponding MessagesChannel, receives data (messages) that is being broadcasted by the Message Controller, and then appends it onto the screen.

function createMessageChannel() {
  // for this the messages table is going to equal the app.cable.subscriptions table and create one
  // A consumer becomes a subscriber by creating a subscription to a given channel
  // MessagesChannel is going into the channels => message_channel.rb
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chatroom_id: parseInt($("#message_chatroom_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  },
      });
      // return what was created above
return App.messages;
}
