class PetsController < ApplicationController
  before_action :find_pet, only: [:edit, :show, :update]
  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to user_path(current_user.slug)
    else
      flash[:error] = "Your pet was not saved!"
    end
  end

  def find_pet
    @pets = Pet.friendly.find(params[:slug])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :age, :image, :about_me, :user_id)
  end


end
