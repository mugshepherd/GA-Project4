class Violation < ActiveRecord::Base
  has_many :inspections
  has_many :potential_violations
end
