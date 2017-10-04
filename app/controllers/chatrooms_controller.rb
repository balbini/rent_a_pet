# This library is an interface for secure random number generator which is suitable for generating session key in HTTP cookies, etc. # You can use this library in your application by requiring it:
require 'securerandom'

class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :before_enter_room, only: [:show]
  def index
    chatrooms = current_user.chatrooms
    @existing_chatrooms_users = current_user.existing_chatrooms_users
  end

  def create
    @other_user = User.find(params[:other_user])
    # if you can't find a Chatroom with that other_users ID, create a new one with a unique identifer
    @chatroom = find_chatroom(@other_user) || Chatroom.new(identifier: SecureRandom.hex)
    # .persisted? returns true if the record is persisted, i.e. it’s not a new record and it was not destroyed, otherwise returns false. In thie case it is saying if chat is persisted return false (the opposite)
    if !@chatroom.persisted?
      @chatroom.save
      @chatroom.subscriptions.create(user_id: current_user.id)
      @chatroom.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chatroom_path(current_user, @chatroom,  :other_user => @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new

  end

  private

  def before_enter_room
    @other_user = User.find(params[:other_user])
    if (Chatroom.find(params[:id]).subscriptions[0].user_id == @other_user.id || Chatroom.find(params[:id]).subscriptions[1].user_id == @other_user.id) && (Chatroom.find(params[:id]).subscriptions[0].user_id == current_user.id || Chatroom.find(params[:id]).subscriptions[1].user_id == current_user.id)
    else
      flash[:error] = "Sorry, the conversation with between 'A' and 'B', please 'C' your way out."
      redirect_to user_chatrooms_path(current_user)
    end
  end

  def find_chatroom(second_user)
    chatrooms = current_user.chatrooms
    chatrooms.each do |chatroom|
      chatroom.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chatroom
        end
      end
    end
    nil
  end

end
