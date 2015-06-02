class Inspection < ActiveRecord::Base
  has_many :restaurants 
  has_many :violation_keys, through :violations
end
