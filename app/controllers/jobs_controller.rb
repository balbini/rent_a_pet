class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :find_job, only: [:edit, :show, :update]

  def index
  end

  def show
  end

  def new
    @job = Job.new
    explode
  end

  def create
    explode
    @job = Job.new(job_params)
    if @job.save
      @current.posts<<@post
    end
    redirect_to user_path(@user)
  end

  def find_job
    @job = Job.find_by_id(params[:id])
  end
end
