require 'rails_helper'

RSpec.describe 'As a Visitor' do
  before :each do
  	@application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @application_2 = Application.create!(name: 'Jammy', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
    @application_2.pets << @pet1

  end
  describe'when I navigate to an application show page' do

  	it'displays the information about the application'do
  	visit "applications/#{@application_1.id}"
    	within("#shown-app") do
  			expect(page).to have_content("Ben")
  			expect(page).to have_content("123 street,Denver,CO,80220")
    	end
  	end

    it'can search for pets'do
      visit "applications/#{@application_1.id}"
      fill_in("search", with: "thor")
      click_button("Search")
      within("#in-progress-app")do
        expect(page).to have_content("#{@pet1.name}")
      end
    end

     it'can search for pets and add it to the application'do
      visit "applications/#{@application_1.id}"
      fill_in("search", with: "thor")
      click_button("Search")
      within("#in-progress-app")do
        expect(page).to have_button("Adopt this pet")
        click_button("Adopt this pet")
      end

      within("#attached-pets")do
        expect(page).to have_content("#{@pet1.name}")
      end
      fill_in("description", with: "me want thor")
      click_button("Submit Application")
      

      within("#shown-app")do
        expect(page).to have_content("Application Status: Pending")
      end
      
    end
  end

end