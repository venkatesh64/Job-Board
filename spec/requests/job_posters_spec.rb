require "rails_helper"

RSpec.describe "Job Posters", type: :request do
  describe "GET /api/v1/job_posters" do
    it "gets all job posters and returns them" do
      job_poster = create :job_poster, first_name: "Anders", last_name: "Bjork"

      get api_v1_job_posters_path

      expect(response).to have_http_status(:ok)

      expect(json_response).to contain_exactly(
        a_hash_including(
          "id" => job_poster.id,
          "full_name" => "Anders Bjork"
        )
      )
    end
  end
end
