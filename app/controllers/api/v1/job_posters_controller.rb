module Api
  module V1
    class JobPostersController < ApiController
      def index
        render json: JobPoster.all
      end
    end
  end
end
