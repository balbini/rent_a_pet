class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
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
    if user_check
      @pet = Pet.find_by_id(params[:id])
    else
      flash[:notice] = "Cannot edit other pets"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if user_check
      @pet = Pet.find_by_id(params[:id])
      @pet.update(pet_params)
      redirect_to user_path(current_user.slug)
    else
      flash[:error] = "Cannot edit other pets"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if user_check
      @pet = Pet.find_by_id(params[:id])
      @pet.destroy
      redirect_to user_path(current_user.slug)
    else
      flash[:error] = "Cannot delete other pets"
      redirect_back(fallback_location: root_path)
    end
  end

  def user_check
    @pet = Pet.find_by_id(params[:id])
    if current_user.id.to_s == @pet.user_id.to_s
      true
    else
      false
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :age, :image, :about_me, :user_id)
  end



end
