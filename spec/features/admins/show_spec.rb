require 'rails_helper'

RSpec.describe'As a visitor'do
	before :each do
		@application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
	  @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
	  @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
	  @application_2 = Application.create!(name: 'Jammy', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
	  @application_2.pets << @pet1
	end
	it'displays the info about application'do
		visit "/admin/applications/#{@application_2.id}"
		within("#app-info")do
			expect(page).to have_content("#{@application_2.name}")
		end
	end
end