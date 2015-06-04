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
          coordinates: [restaurant.latitude.to_f , restaurant.longitude.to_f]
        },
        properties: {
          name: restaurant.name,
          address: restaurant.address,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @geojson = Array.new

      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [@restaurant.latitude.to_f , @restaurant.longitude.to_f]
        },
        properties: {
          title: @restaurant.name,
          description: @restaurant.address,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    
    respond_to do |format|
      format.html
      format.json {render json: @geojson}
    end
  end

  
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
