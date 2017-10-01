class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :find_job, only: [:edit, :show, :update]

  def index
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      flash[:error] = "Your job was not saved!"
    end
  end

  def edit
    @job = Job.find_by_id(params[:id])
  end

  def update
      @job = Job.find_by_id(params[:id])
      @job.update(job_params)
      redirect_to user_path(current_user.slug)
  end

  def find_job
    @job = Job.find_by_id(params[:id])
  end

  def destroy
    @job = Job.find_by_id(params[:id])
    @job.destroy
    redirect_to user_path(current_user.slug)
  end


  private
  def job_params
    params.require(:job).permit(:title, :description, :owner_id, :city, :pet_id, :begin_date, :end_date)
  end


end
