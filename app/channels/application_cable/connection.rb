module ApplicationCable
  class Connection < ActionCable::Connection::Base
  end
end

# The Connection class is where we would authorize the incoming connection—for example, establishing a channel to a given user’s inbox, which requires user authorization. We'll leave this class alone, as any user can join any chat room at any time. However, the Messages Channel that we will define shortly will inherit from ApplicationCable::Channel.
