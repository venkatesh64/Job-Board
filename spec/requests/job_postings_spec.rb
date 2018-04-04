require "rails_helper"

RSpec.describe "Job Postings", type: :request do
  describe "GET /api/v1/job_postings" do
    it "gets all job postings and returns them" do
      poster = create :job_poster, first_name: "Tuukka", last_name: "Rask"
      location = create :location, city: "Boston"
      category = create :category, name: "hockey"

      create :job_posting,
        job_poster: poster,
        location: location,
        category: category,
        title: "Backup Goalie",
        description: "Must be willing to work on short notice",
        status: "new_post"

      get api_v1_job_postings_path

      expect(response).to have_http_status(:ok)
      expect(json_response).to contain_exactly(
        a_hash_including(
          "job_poster" => a_hash_including("full_name" => "Tuukka Rask"),
          "title" => "Backup Goalie",
          "description" => "Must be willing to work on short notice",
          "location" => a_hash_including("city" => "Boston"),
          "category" => a_hash_including("name" => "Hockey"),
          "status" => "New Post"
        )
      )
    end
  end

  describe "POST /api/v1/job_postings" do
    context "with a valid request" do
      it "creates a new job posting" do
        location = create :location
        category = create :category
        poster = create :job_poster

        posting_params = {
          title: "Puck-moving Defenseman",
          job_poster_id: poster.id,
          category_id: category.id,
          location_id: location.id,
          status: "pending",
          description: "Quick skater focused on making the first pass out of the zone."
        }

        post api_v1_job_postings_path, params: { job_posting: posting_params }

        posting = JobPosting.last

        expect(response).to have_http_status(:created)
        expect(json_response).to include(
          "id" => posting.id,
          "title" => "Puck-moving Defenseman",
          "status" => "Pending",
          "description" => "Quick skater focused on making the first pass out of the zone.",
          "category" => a_hash_including("id" => category.id),
          "location" => a_hash_including("id" => location.id),
          "job_poster" => a_hash_including("id" => poster.id)
        )
      end
    end

    context "with an invalid request" do
      it "does not persist a posting and provides the errors" do
        posting_params = { title: nil }

        post api_v1_job_postings_path, params: { job_posting: posting_params }

        expect(JobPosting.count).to eq 0
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response).to include(
          "title" => ["can't be blank"]
        )
      end
    end
  end
end
