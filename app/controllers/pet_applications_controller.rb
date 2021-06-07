class PetApplicationsController < ApplicationController
  def show
    # @pet_app = PetApplication.find(params[:id])
    @application = Application.find(params[:id])
    render "admins/show"
  end
end
