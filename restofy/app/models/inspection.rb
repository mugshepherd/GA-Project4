class Inspection < ActiveRecord::Base
  belongs_to :restaurant
  has_many :violations
  has_many :potential_violations, through: :violations
  # validates :restaurant_id, presence: true
end
