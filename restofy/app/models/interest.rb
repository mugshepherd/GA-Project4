class Interest < ActiveRecord::Base
	belongs_to :profile

	validates :interests, :presence => true
end