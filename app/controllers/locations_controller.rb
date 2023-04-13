class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    debugger
    @location = Location.find(params[:id])
  end
  
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    debugger
    if @location.save

      redirect_to locations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to @locations
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path(@locations)
  end

  private
  def location_params
    params.require(:location).permit(:name_of_location, :address, :location_identification_code, :postal, :code, :state, :country, :user_id)
  end

end
