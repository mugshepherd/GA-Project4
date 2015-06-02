class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants?completed=true
  # GET /restaurants?completed=false

  def index
    @restaurants = Restaurant.all
    @geojson = Array.new

    @restaurants.each do |restaurant|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [longitude, latitude]
        },
        properties: {
          name: restaurant.name,
          address: restaurant.street,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end

  
  private
  def restaurant_params
    params.require(:restaurant).permit(:description, :completed)
  end

end
