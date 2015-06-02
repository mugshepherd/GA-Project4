class Inspection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :potential_violations, through: :violations
end
