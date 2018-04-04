module Api
  module V1
    class JobPostingStatusesController < ApiController
      def index
        statuses = JobPosting.statuses.keys.map do |status|
          { name: status.titleize, value: status }
        end

        render json: statuses
      end
    end
  end
end
