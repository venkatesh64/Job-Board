require "rails_helper"

RSpec.describe "JobPostingStatuses", type: :request do
  describe "GET /api/v1/job_posting_statuses" do
    it "gets all job posting statuses and returns them" do
      get api_v1_job_posting_statuses_path

      expect(response).to have_http_status(:ok)

      expect(json_response).to match_array(
        [
          {
            "name" => "New Post",
            "value" => "new_post"
          },
          {
            "name" => "Pending",
            "value" => "pending"
          },
          {
            "name" => "Complete",
            "value" => "complete"
          }
        ]
      )
    end
  end
end
