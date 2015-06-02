class Inspection < ActiveRecord::Base
  has_many :restaurants 
  has_many :potential_violations, through :violations
end
