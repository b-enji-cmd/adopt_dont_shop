class Application < ApplicationRecord
	has_many :pet_applications
	has_many :pets, through: :pet_applications

	validates :name, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true

	def get_full_address
		[street,city,state,zip].join(",")
	end

	def search(search)
		if !search.nil?
			Pet.where("LOWER(name) like ?", "%#{search.downcase}%")
					.where.not(id: pets.pluck(:id))
		else
			Pet.where.not(id: pets.pluck(:id))
		end  	
  end

  def adopt_pets(params)
  	if params[:approve]
  		pets.find(params[:approve]).update(adoptable: false)
  		update(status: "Approved") if pets.all?{|pet| pet.adoptable == false}
  	elsif params[:reject]
  		binding.pry
  	end
  end

  def submit(desc)
  	update(status: "Pending", description: desc)
  end
	
end
