class Interests < ActiveRecord::Base

	def new
		@user = current_user
		@interests = Favorites.new
	end

	def create
		@user = current_user
		@interests = Favorites.new
		if @interests.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def edit
		@interests = current_user.profile.interests
	end

	def update
		@interests = current_user.profile.interests
	end

end