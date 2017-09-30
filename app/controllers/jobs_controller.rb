class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :find_job, only: [:edit, :show, :update, :destroy, :check_owner]

  def index
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if job_params["begin_date"].to_date < DateTime.now.to_date
        flash[:error] = "Job cannot start in the past. Please fix the dates"
        render new_job_path(@job)
    else
      if job_params["end_date"].to_date >= job_params["begin_date"].to_date
        if @job.save
          redirect_to job_path(@job)
        else
          flash[:error] = "Sorry! We ran into an error - could you try again?"
        end
      else
        flash[:error] = "Job cannot end before the begin date. Please fix the dates and update again"
        render new_job_path(@job)
      end
    end
  end

  def edit
  end

  def update
    if job_params["begin_date"].to_date < DateTime.now.to_date
        flash[:error] = "Job cannot start in the past. Please fix the dates"
        render :edit
    else
      if job_params["end_date"].to_date >= job_params["begin_date"].to_date
        if @job.save
          @job.update_attributes(job_params)
          redirect_to job_path(@job)
        else
          flash[:error] = "Sorry! We ran into an error - could you try again?"
          render :edit
        end
      else
        flash[:error] = "Job cannot end before the begin date. Please fix the dates and update again"
        render :edit
      end
    end
  end

  def destroy
    owner_slug = @job.owner.slug
    @job.destroy
    redirect_to user_path(owner_slug)
    # once path is set use the path below
    # redirect_back(fallback_location: root_path)
  end

  def find_job
    @job = Job.find_by_id(params[:id])
  end


  private
  def job_params
    params.require(:job).permit(:title, :description, :owner_id, :city, :pet_id, :begin_date, :end_date, :status)
  end

  def check_owner
  # both are the same thing current_user.id == params[:id] and session[:id] === params[:id] => only if these are true then it allows the method to work for that SPECIFIC PARAMETER IN THE URL
  # if the person that is logged is not the same as the persons data we are looking at ... flash a message or redirect_to their own page
    if session[:user_id].to_s != @job.user.id.to_s
      redirect_to user_path(current_user)
    end
  end
end
