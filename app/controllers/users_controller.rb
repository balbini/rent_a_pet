class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :find_user, only: [:edit, :show, :update]

  def show
    @pets = @user.pets
    @posted_jobs = @user.posted_jobs.order(created_at: :desc)
    @working_jobs = @user.working_jobs.order(created_at: :desc)
  end

  def find_user
    @user = User.friendly.find(params[:slug])
  end

end
