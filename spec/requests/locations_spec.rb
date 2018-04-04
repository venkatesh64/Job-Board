require "rails_helper"

RSpec.describe "Locations", type: :request do
  describe "GET /api/v1/locations" do
    it "gets all locations and returns them" do
      location = create :location,
        name: "TD Garden",
        street_address_1: "100 Legends Way",
        street_address_2: "Suite 4",
        city: "Boston",
        state: "MA",
        zip_code: "02114"

      get api_v1_locations_path

      expect(response).to have_http_status(:ok)

      expect(json_response).to contain_exactly(
        a_hash_including(
          "id" => location.id,
          "name" => location.name,
          "street_address_1" => location.street_address_1,
          "street_address_2" => location.street_address_2,
          "city" => location.city,
          "state" => location.state,
          "zip_code" => location.zip_code
        )
      )
    end
  end
end
