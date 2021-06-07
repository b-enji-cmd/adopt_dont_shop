class ApplicationsController < ApplicationController
	 def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def update
    application = Application.find(params[:id])
    binding.pry
    if params[:description]
      application.submit(params[:description])
    elsif params[:pet_id]
      PetApplication.create!(pet_id: params[:pet_id], application_id: application.id)
    end
    
    application.update(application_params)
    redirect_to "/applications/#{application.id}"
  end

  def show
  	@application = Application.find(params[:id])
    binding.pry
    @potential_pets = @application.search(params[:search])


  end

  def create
  	  application = Application.new(application_params)
 			if application.save

        redirect_to "/applications/#{application.id}"
      else
        flash.now[:notice] = 'Missing fields, please fill in all info.'
        render :new
      end
  end



  private
  def application_params
    params.permit(:name,:street, :city, :state, :zip, :search, :description, :status)
  end

  def application_update
    params.permit(:id, :pet_id)
  end
end
