class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:edit, :show, :update]

  def show
    @pets = @user.pets.page(params[:page]).per(3).order(created_at: :desc)
    @posted_jobs = @user.posted_jobs.order(created_at: :desc).page(params[:page]).per(3)
    @working_jobs = @user.working_jobs.order(created_at: :desc).page(params[:page]).per(3)
  end

  def find_user
    @user = User.friendly.find(params[:slug])
  end

end
