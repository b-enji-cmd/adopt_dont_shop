class AdminsController < ApplicationController
	def show
		@application = Application.find(params[:id])
	end

	def update
		application = Application.find(params[:id])
		pet = Pet.find(params[:pet_id])
		pet.adopt
		redirect_to "/admin/applications/#{application.id}"
	end

end