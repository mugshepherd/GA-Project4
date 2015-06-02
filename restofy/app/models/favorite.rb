class Favorite < ActiveRecord::Base
	belongs_to :profile

	validates :location, :presence => true
end