class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def index
    @jobs = Job.all
  end

  def show_all_jobs
    @jobs = Job.all
  end
  
end
