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
      flash[:error] = "Your pet was not saved!"
    end
  end

  def find_job
    @job = Job.find_by_id(params[:id])
  end


  private
  def job_params
    params.require(:job).permit(:title, :description, :owner_id, :city, :pet_id, :begin_date, :end_date)
  end
    # t.string "title"
    # t.string "description"
    # t.string "zip"
    # t.date "begin_date"
    # t.date "end_date"
    # t.integer "dollar_value"
    # t.string "type_of_job"
    # t.string "status"
    # t.string "recurring"
    # t.string "pet_location"
    # t.date "expiration_date"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.string "address"
    # t.string "city"
    # t.string "state"
    # t.integer "owner_id"
    # t.integer "freelancer_id"
    # t.bigint "pet_id"

end
