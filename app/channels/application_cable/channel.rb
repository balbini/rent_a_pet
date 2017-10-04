module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end

# The Channel class is where we would place shared logic among any additional channels that we will define. We'll only be creating one channel, the Messages Channel, so we'll leave this class alone as well.
