class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	layout :layout_by_resource

 	protect_from_forgery with: :exception
  
 	@restaurants = Restaurant.all

 	protected

 	def layout_by_resource 
    	if devise_controller? && resource_name == :admin && action_name == "new"
      		"layout_name_for_devise"
    	else
      		"application"
    	end
  	end

end
