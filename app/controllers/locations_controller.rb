class LocationsController < ApplicationController
  before_action :set_location, only: %i[ show edit update destroy ]

  def index
    @locations = Location.all
  end

  def show
  end
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save

      redirect_to locations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy

    redirect_to locations_path(@locations)
  end

  private
  def location_params
    params.require(:location).permit(:name_of_location, :address, :location_identification_code, :postal, :code, :state, :country, :user_id)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
