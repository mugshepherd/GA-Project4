class ProfilesController < ApplicationController

	before_action :authenticate_user!

	def index
		@profile = current_user.profiles.find(params[:id])
	end

	def show
		@user = current_user
		@profile = current_user.profiles.find(params[:id])
		# @interests = current_user.interests.find(params[:id])

	end

	def new
		@user = current_user
		@profile = current_user.profiles.new
	end

	def create
		@profile = current_user.profiles.new(profile_params)
		if @profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = current_user.profiles.find(profile_params)
	end

	private
	def profile_params
    	params[:profile].permit(:name, :photo_url, :hometown, :interests, :favorites, :about_me)
	end

end