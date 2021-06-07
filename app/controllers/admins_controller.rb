class AdminsController < ApplicationController
	def show
		@application = Application.find(params[:id])
	end

	def update
		binding.pry
		application = Application.find(params[:id])
		# @pet_app = PetApplication.where(pet_id: params[:approve], application_id: params[:id]).first
		redirect_to "/admin/applications/#{application.id}"
	end

end
