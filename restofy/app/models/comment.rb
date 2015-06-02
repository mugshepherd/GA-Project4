class Comment < ActiveRecord::Base
	belongs_to :profile

	validates :comments, :presence => true
end