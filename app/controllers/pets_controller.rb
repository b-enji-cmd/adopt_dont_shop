class PetsController < ApplicationController

  def index
    # @pets = Pet.search(params[:search])
    @pets = Pet.all
    # redirect_to "applications/#{params[:app_id]}" if params[:app_id]
  end

  def new
    shelter = Shelter.find(params[:id])
  end

  def create
    @pet = Pet.new(pets_params)
    if @pet.save
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      render :new, notice: "#{@pet.errors.full_messages}"
    end

  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pets_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  private
  def pets_params
    params.permit(:image, :name, :description, :approximate_age, :sex, :adoptable, :shelter_id)
  end

end
