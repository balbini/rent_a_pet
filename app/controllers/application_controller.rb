class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :check_if_job_is_owners, :check_if_job_is_subitted_owners, :check_if_job_is_saved_to_db_by_freelancer, :check_if_job_is_freelancers, :check_if_job_status_submitted_by_freelancer, :check_if_job_is_freelancers_for_submission,


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
    # !job_freelancer_params["freelancer_id"].nil? same thing as saying if job_freelancer_params.nil? is true then return false
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

  def find_job
    @job = Job.find_by_id(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :roles, :about_me, :address, :city, :state, :zip, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :about_me, :address, :city, :state, :zip, :image])
  end


  def after_sign_in_path_for(resource_or_scope)
   user_path(resource_or_scope)
  end


end
