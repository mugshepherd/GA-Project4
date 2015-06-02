class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants?completed=true
  # GET /restaurants?completed=false

  def index
   @restaurants = Restaurant.all

  respond_to do |format|
    format.html { render :index }
    format.json { render json: @restaurants }
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
