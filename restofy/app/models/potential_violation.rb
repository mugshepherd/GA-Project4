class PotentialViolation < ActiveRecord::Base
	has_many :inspections, through :violations
end
