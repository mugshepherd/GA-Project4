class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants?completed=true
  # GET /restaurants?completed=false

  def index
    @restaurants = Restaurant.all.limit(100)
    @geojson = Array.new

    @restaurants.each do |restaurant|
      last_inspection = restaurant.inspections.last
      restaurant_info = {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [restaurant.longitude.to_f,restaurant.latitude.to_f]
        },
        properties: {
          id: restaurant.id,
          title: restaurant.name,
          description: restaurant.address,
          # 'last_inspection': last_inspection ? last_insepction.date : nil,
          # 'Critical Violations': restaurant.inspections.last.critical_violations,
          # 'Non-critical Violations': restaurant.inspections.last.non_critical_violations,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
        if last_inspection
          restaurant_info = restaurant_info.merge(last_inspection: last_inspection)
        end
      @geojson << restaurant_info
    end
    gon.geojson = @geojson
    respond_to do |format|
      format.html
      format.json { render json: @geojson }  # respond with the created JSON object
    end
  end

  # def show
  #   @restaurant = Restaurant.find(params[:id])
  #   @geojson = Array.new

  #     @geojson << {
  #       type: 'Feature',
  #       geometry: {
  #         type: 'Point',
  #         coordinates: [restaurant.longitude.to_f,restaurant.latitude.to_f]
  #       },
  #       properties: {
  #         title: restaurant.name,
  #         description: restaurant.address,
  #         :'marker-color' => '#00607d',
  #         :'marker-symbol' => 'circle',
  #         :'marker-size' => 'medium'
  #       }
  #     }
    
  #   respond_to do |format|
  #     format.html
  #     format.json {render json: @geojson}
  #   end
  # end

  
  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
