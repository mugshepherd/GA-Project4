class Violation < ActiveRecord::Base
  belongs_to :inspection
  belongs_to :potential_violation
end
