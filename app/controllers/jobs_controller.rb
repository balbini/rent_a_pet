class JobsController < ApplicationController
  # before_action :authenticate_user! will check if the user is authenticated before calling the secret method
  before_action :authenticate_user!, only: [:check_owner, :check_freelancer, :new, :create, :edit, :update, :destroy, :job_freelancer_params]
  before_action :find_job, only: [:edit, :show, :update, :destroy, :check_owner]
  before_action :check_owner, only: [:edit, :update, :destroy]
  helper_method :check_if_job_is_owners, :check_if_job_is_subitted_owners, :check_if_job_is_saved_to_db_by_freelancer, :check_if_job_is_freelancers, :check_if_job_status_submitted_by_freelancer, :check_if_job_is_freelancers_for_submission,


  def index

  end

  def all
    if params[:query].present?
      @jobs = Job.search(params[:query], page: params[:page], per_page: 1, misspellings: {below: 5})
    else
      @jobs = []
    end
  end

  def autocomplete
    render json: Job.search(params[:query], {
        fields: ["title", "description", "city"]
        }).map(&:title)
  end


  # def autocomplete
  #   render json: Job.search(params[:query], autocomplete: false, limit: 10).map    do |job|
  #     {
  #       title: job.title,
  #       description: job.description,
  #       city: job.city,
  #       zip: job.zip,
  #       owner_name: job.owner.first_name,
  #       freelancer_name: job.freelancer.nil? ? "" : job.freelancer.first_name,
  #       pet_breed: job.pet.breed,
  #     }
  #   end
  # end

  def show
    @job = Job.find(params[:id])
  end

  def show_all_jobs
    @jobs = Job.all.order(status: :desc, created_at: :desc)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if job_params["begin_date"].to_date < DateTime.now.to_date
        flash[:error] = "Job cannot start in the past. Please fix the dates and try again."
        render new_job_path(@job)
    else
      if job_params["end_date"].to_date >= job_params["begin_date"].to_date
        if @job.save
          redirect_to job_path(@job)
        else
          flash[:error] = "Sorry! We ran into an error - could you try again?"
        end
      else
        flash[:error] = "Job cannot end before it starts. Please fix the dates and try again."
        render new_job_path(@job)
      end
    end
  end

  def edit
    @job = Job.find_by_id(params[:id])
  end

  def update
    if (check_if_job_status_submitted_by_freelancer && check_if_job_is_freelancers_for_submission) || (check_if_job_status_submitted_by_freelancer && check_if_job_is_saved_to_db_by_freelancer == false)
      if @job.save
        # explode
        @job.update_attributes(job_freelancer_params)
        redirect_to job_path(@job)
      else
        flash[:error] = "Sorry! We ran into an error - could you try again?"
        render :edit
      end
    elsif check_if_job_status_submitted_by_freelancer == true && check_if_job_is_freelancers_for_submission != true
      flash[:error] = "Sorry! You can only update your own jobs!"
    end

    if check_if_job_is_subitted_owners
      # explode
      if job_params["begin_date"].to_date < DateTime.now.to_date
        # explode
          flash[:error] = "Job cannot start in the past. Please fix the dates and try again."
          render :edit
      elsif job_params["end_date"].to_date >= job_params["begin_date"].to_date
        # explode
          if @job.save
             @job.update_attributes(job_params)
             redirect_to job_path(@job)
          else
             flash[:error] = "Sorry! We ran into an error - could you try again?"
             render :edit
          end
      else
        flash[:error] = "Job cannot end before it starts. Please fix the dates and try again."
        render :edit
      end
    elsif check_if_job_status_submitted_by_freelancer == false && check_if_job_is_subitted_owners == false
      # explode
      if @job.save
        # explode
        @job.update_attributes(job_freelancer_params)
        redirect_to job_path(@job)
      else
        flash[:error] = "Sorry! We ran into an error - could you try again?"
        render :edit
      end
    end
  end

  def destroy
    if check_if_job_is_owners == true
      owner_slug = @job.owner.slug
      @job.destroy
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Sorry! Only the owner can delete the job"
      redirect_to job_path(@job.id)
    end
  end

  def find_job
    @job = Job.find_by_id(params[:id])
  end

  def check_if_job_is_owners
    if current_user.id.to_s == @job.owner.id.to_s
      true
    else
      false
    end
  end

  def check_if_job_is_subitted_owners
    if job_params["owner_id"].to_s == @job.owner.id.to_s
      true
    else
      false
    end
  end

  def check_if_job_is_saved_to_db_by_freelancer
    if @job.freelancer.nil?
      false
    else
      true
    end
  end

  def check_if_job_is_freelancers
    if current_user.id.to_s == @job.freelancer.id.to_s
      true
    else
      false
    end
  end

  def check_if_job_status_submitted_by_freelancer
    if job_freelancer_params["freelancer_id"].nil?
      false
    else
      true
    end
    # !job_freelancer_params["freelancer_id"].nil?
  end

  def check_if_job_is_freelancers_for_submission
    if check_if_job_status_submitted_by_freelancer == true && check_if_job_is_saved_to_db_by_freelancer == true
      if job_freelancer_params["freelancer_id"].to_s == @job.freelancer.id.to_s
        true
      else
        false
      end
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :owner_id, :city, :pet_id, :begin_date, :end_date, :status)
  end
  def job_freelancer_params
    params.require(:job).permit(:status, :freelancer_id)
  end

  def check_owner
    if @job.freelancer.nil? #if the freelancer is empty is true
      if current_user.id.to_s != @job.owner.id.to_s #check to see if the current_id is the ower id if that is NOT true - then redirect them
        # explode
        # redirect_to edit_job_path(@job.id)
      end
    elsif current_user.id.to_s == @job.owner.id.to_s #check to see if the current_id is the freelancer's id if that is NOT true - if it they are equal let them edit
    elsif current_user.id.to_s != @job.freelancer.id.to_s
      redirect_to job_path(@job.id)
    end
  end

  # def update2
  #   if check_if_owner == true
  #
  #   if job_freelancer_params["freelancer_id"].nil?
  #     # no freelancer id means that job is open so do some checks
  #     if job_params["begin_date"].to_date < DateTime.now.to_date
  #         flash[:error] = "Job cannot start in the past. Please fix the dates"
  #         render :edit
  #     else
  #       if job_params["end_date"].to_date >= job_params["begin_date"].to_date
  #         if @job.save
  #           @job.update_attributes(job_params)
  #           redirect_to job_path(@job)
  #         else
  #           flash[:error] = "Sorry! We ran into an error - could you try again?"
  #           render :edit
  #         end
  #       else
  #         flash[:error] = "Job cannot end before the begin date. Please fix the dates and update again"
  #         render :edit
  #       end
  #     end
  #   elsif job_freelancer_params["freelancer_id"] == @job.freelancer.id
  #     if @job.save
  #       @job.update_attributes(job_freelancer_params)
  #       redirect_to job_path(@job)
  #     else
  #       flash[:error] = "Sorry! We ran into an error - could you try again?"
  #       render :edit
  #     end
  #     # redirect_to back
  #   # if the frelancer is trying update one that is not their own
  #   else
  #     flash[:error] = "Sorry! You can only edit your own jobs"
  #   end
  # end
end
