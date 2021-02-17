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

	def self.search(search)
		if search
			Pet.where("LOWER(name) like ?", "%#{search.downcase}%")
		else
			Pet.all
		end  	
  end

  def add_pet(arg_id)
  	matching = Pet.where("id = #{arg_id}")
  	matching.each do |pet|
  		pets << pet
  	end
  end

  def submit(desc)
  	assign_attributes(status: "Pending", description: desc)
  end
	
end