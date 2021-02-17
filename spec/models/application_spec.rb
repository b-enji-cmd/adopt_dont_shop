require 'rails_helper'

RSpec.describe Application do
	before :each do
  	@application_1 = Application.create!(name: 'Ben', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
  	@shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    # @application_2 = Application.create!(name: 'Jammy', street: '123 street', city: 'Denver', state: 'CO', zip: '80220')
    # @application_2.pets << @pet1
  end

  describe 'relationships' do
		it { should have_many :pet_applications}

		it {should have_many(:pets).through(:pet_applications)}
  end
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :street }
		it { should validate_presence_of :city }
		it { should validate_presence_of :state }
		it { should validate_presence_of :zip }
	end

	describe 'class methods' do
		it'::search'do
		expect(Application.search("Thor").length).to eq(1)
		expect(Application.search("THOR")).to eq([@pet1])
		end

	end

	describe 'instance methods' do

		it'#get_full_address'do
			expect(@application_1.get_full_address).to eq("123 street,Denver,CO,80220")
		end

		it'#add_pet'do
			@application_1.add_pet("#{@pet1.id}")
			expect(@application_1.pets.include?(@pet1)).to eq(true)
		end

		it'#submit'do
			@application_1.submit("gimme da dog")
			expect(@application_1.description).to eq("gimme da dog")
			expect(@application_1.status).to eq("Pending")
		end
		
	end


end