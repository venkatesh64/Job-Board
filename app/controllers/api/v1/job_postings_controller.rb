module Api
  module V1
    class JobPostingsController < ApiController
      def create
        @job_posting = JobPosting.new(job_posting_params)

        if @job_posting.save
          render json: @job_posting, status: :created
        else
          render json: @job_posting.errors, status: :unprocessable_entity
        end
      end

      def index
        @job_postings = JobPosting.all
          .includes(:job_poster, :category, :location)

        render json: @job_postings
      end

      private

      def job_posting_params
        params.require(:job_posting)
          .permit(:title, :job_poster_id, :category_id, :location_id, :status, :description)
      end
    end
  end
end
