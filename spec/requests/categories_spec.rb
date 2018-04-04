require "rails_helper"

RSpec.describe "Categories", type: :request do
  describe "GET /api/v1/categories" do
    it "gets all categories and returns them" do
      category = create :category, name: "some category"

      get api_v1_categories_path

      expect(response).to have_http_status(:ok)

      expect(json_response).to contain_exactly(
        a_hash_including(
          "id" => category.id,
          "name" => "Some Category"
        )
      )
    end
  end
end
