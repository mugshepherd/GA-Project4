class ProfilesController < ApplicationController

	before_action :authenticate_user!

	def index
		@profile = current_user.profile.find(params[:id])
	end

	def show
		@user = current_user
		@profile = current_user.profile.find(params[:id])
		# @interests = current_user.interests.find(params[:id])

	end

	def new
		@user = current_user
		@profile = Profile.new
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
		@profile = current_user.profile
	end

	private
	def profile_params
    	params[:profile].permit(:name, :photo_url, :hometown, :interests, :favorites, :about_me)
	end

end