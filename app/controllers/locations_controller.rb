class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  def new
    @location = Location.new
  end

  def show; end

  private

  def location_params
    params.require(:location)
      .permit(:name, :street_address_1, :street_address_2, :city, :state, :zip_code)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
