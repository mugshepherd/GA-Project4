class Favorites < ActiveRecord::Base

	def new
		@user = current_user
		@favorites = Favorites.new
	end

	def create
		@user = current_user
		@favorites = Favorites.new
		if @favorites.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def edit
		@favorites = current_user.profile.favorites
	end

	def update
		@favorites = current_user.profile.favorites
	end

end