class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end
end
