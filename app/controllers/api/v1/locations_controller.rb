module Api
  module V1
    class LocationsController < ApiController
      def index
        render json: Location.all
      end
    end
  end
end
