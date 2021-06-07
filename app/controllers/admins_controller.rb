class AdminsController < ApplicationController
	def show
		@application = Application.find(params[:id])
	end

	def update
		application = Application.find(params[:id])
		application.adopt_pets(application_params)

		# @pet_app = PetApplication.where(pet_id: params[:approve], application_id: params[:id]).first
		redirect_to "/admin/applications/#{application.id}"
	end

	private

	def application_params
		params.permit(:approve, :reject)
	end

end
