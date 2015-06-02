class Favorite < ActiveRecord::Base
	belongs_to :profile

	validates :favorites, :presence => true
end