module Api
  module V1
    class CategoriesController < ApiController
      def index
        render json: Category.all
      end
    end
  end
end
