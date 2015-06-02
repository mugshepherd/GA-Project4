class CommentsController < ApplicationController

	before_action :authenticate_user!

	def index
		@comments = comments.all
	end

	def show
		@user = current_user
		@comment = current_user.profile.comments.find(params[:id])
	end

	def new
		@user = current_user
		@profile = current_user.profiles.find(params[:id])
		@comment = @profile.comments.new
	end

	def create
		@comment = @profile.comments.new(comment_params)
		if @comment.save
			redirect_to @comment
		else
			render 'new'
		end
	end

	def edit
		@comment = Profile.find(params[:id])
	end

	def update
		@comment = current_user.comments.find(comment_params)
	end

	private
	def comment_params
    	params[:comment].permit(:content)
	end

end