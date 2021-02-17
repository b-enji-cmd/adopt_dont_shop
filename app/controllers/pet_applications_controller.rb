class PetApplicationsController < ApplicationController

  def index
    # @pet_apps = PetApplication.search(params[:search])
    # redirect_to "applications/#{params[:app_id]}" if params[:app_id]
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    # Pet.destroy(params[:id])
    # redirect_to '/pets'
  end

  private
  def pets_params
   # params.permit(:image, :name, :description, :approximate_age, :sex, :adoptable)
  end

end
