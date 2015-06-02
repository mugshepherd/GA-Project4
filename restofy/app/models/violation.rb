class Violation < ActiveRecord::Base
  belongs_to :inspections
  belongs_to :potential_violations
end
