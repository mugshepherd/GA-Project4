class ProfilesController < ApplicationController

	before_action :authenticate_user!

	def index
		@profile = current_user.profile
		if @profile.blank?
			redirect_to new_profile_path
		else
			redirect_to @profile
		end
	end

	def show

		@user = current_user
		@profile = current_user.profile
		

	end

	def new
		@user = current_user
		@profile = Profile.new
		@restaurants = Restaurant.all
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id
		if @profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def edit
		@profile = current_user.profile
	end

	def update
		@user = current_user
		@profile = current_user.profile
		if @profile.update_attributes(profile_params)
			redirect_to @profile
		else
			render 'edit'
		end
	end

	private
	def profile_params
    	params[:profile].permit(:name, :photo_url, :hometown, :hobby, :about_me)
	end

end