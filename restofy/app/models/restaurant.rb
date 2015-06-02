class Restaurant < ActiveRecord::Base
	has_and_belongs_to_many :inspections
	has_one :yelp_reference

end