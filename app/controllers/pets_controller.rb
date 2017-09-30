class PetsController < ApplicationController
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

  def edit
    @pet = Pet.find_by_id(params[:id])
  end

  def update
    @pet = Pet.find_by_id(params[:id])
    @pet.update(pet_params)
    redirect_to user_path(current_user.slug)
  end

  def destroy
    @pet = Pet.find_by_id(params[:id])
    @pet.destroy
    redirect_to user_path(current_user.slug)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :age, :image, :about_me, :user_id)
  end


end
