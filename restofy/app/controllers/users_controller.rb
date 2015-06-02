class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @profile = current_user.profile
    @profile = Profile.create!(name: params[:name], photo_url: params[:photo_url], hometown: params[:hometown], interests: params[:interests], about_me: params[:about_me])
  end

end
