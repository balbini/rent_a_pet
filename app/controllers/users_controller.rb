class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:edit, :show, :update]
  before_action :check_owner, only: [:show]

  def show
  end

  def find_user
    @user = User.friendly.find(params[:slug])
  end

  def check_owner
    if current_user != @user
      redirect_to root_path
    end
  end

end
