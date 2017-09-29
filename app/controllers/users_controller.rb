class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:edit, :show, :update]


  def show
    # load all that users pets
    @pets = @user.pets.page(params[:page]).per(3)
  end

  def find_user
    @user = User.friendly.find(params[:slug])
  end

end
