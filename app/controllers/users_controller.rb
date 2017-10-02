class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:edit, :show, :update]
  helper_method :check_if_owner_has_picture

  def show
    @pets = @user.pets
    @posted_jobs = @user.posted_jobs.order(created_at: :desc)
    @working_jobs = @user.working_jobs.order(created_at: :desc)
  end

  def find_user
    @user = User.friendly.find(params[:slug])
  end

  # def check_if_owner_has_picture
  #   if @user.image.nil?
  #     image_tag(asset_path('default_user_no_image.png'), class: "circle")
  #   else
  #     image_tag(@user.image, class: "circle")
  #   end
  # end

end
