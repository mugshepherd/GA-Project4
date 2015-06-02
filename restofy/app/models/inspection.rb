class Inspection < ActiveRecord::Base
  belongs_to :restaurants 
  has_many :potential_violations, through :violations
end
