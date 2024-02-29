require "rails_helper"

RSpec.describe ShelterFacade do

  describe "#initialize" do
    it "exists" do
      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"})

      expect(shelter_facade).to be_a(ShelterFacade)
      expect(shelter_facade.name).to eq("red barn")
      expect(shelter_facade.user_id).to eq("1")
      expect(shelter_facade.shelter_service).to be_a(ShelterService)
    end
  end
  
  xdescribe "#shelter" do
    it "can send a get request to return shelter data", :vcr do
      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"}) # when we pass attr to the shelter initialize method is an array of shelter facades rather than 1 shelter facade)
      shelter = shelter_facade.get_shelter

      # binding.pry
      expect(shelter).to_not be(nil)
      expect(shelter.name).to eq("red barn")
      expect(shelter.user_id).to eq("1")
    end

    it "can use shelter data to create a poro", :vcr do
      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"})
      shelter = shelter_facade.get_shelter

      expect(shelter).to be_a(Shelter)
      expect(shelter.id).to eq("1")
      expect(shelter.name).to eq("red barn")
    end
  end

  describe "#create_shelter", :vcr do
    it "can send a post request create a shelter" do
      new_shelter_data = {
        "name": "red barn",
        "user_id": "1"
      }

      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"})
      # binding.pry
      # its stopping here, never makes it to the creatE_shelter facade method
      shelter = shelter_facade.create_shelter(new_shelter_data)


      # expect()

      # expect(status_code).to eq(200)
    end

    # it "can use response to create a poro", :vcr do
    #   shelter_facade = ShelterFacade.new({"shelter": {"name": "Red Barn", "user_id": "1"}})
    #   shelter = shelter_facade.get_shelter

    #   expect(shelter).to be_a(Shelter)
    #   expect(shelter.id).to eq("1")
    #   expect(shelter.name).to eq("red barn")
    # end
  end

  xdescribe "#update_shelter", :vcr do
    it "can send a patch request to update a shelter" do


      expect(status_code).to eq(200)
    end
  end
end