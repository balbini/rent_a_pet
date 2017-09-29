class PetsController < ApplicationController
  before_action :find_pet, only: [:edit, :show, :update]
  def index
    @pets = Pet.all
  end

  def show
  end

  def find_pet
    @pets = Pet.friendly.find(params[:slug])
  end
end
