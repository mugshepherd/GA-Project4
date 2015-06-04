class WelcomeController < ApplicationController

	def index
		@restaurants = Restaurant.all
		@geojson = Array.new

		@restaurants.each do |restaurant|
  		@geojson << {
    		type: 'Feature',
    		geometry: {
      		type: 'Point',
      		coordinates: [restaurant.longitude.to_f, restaurant.latitude.to_f]
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

end