# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
	csv_text = File.read('db/restaurants.csv')
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
	  Restaurant.create!(row.to_hash)
	end

	puts "restaurants created!"

	#create inspection records
	puts "importing inspection data!"
	csv_text = File.read('db/inspections.csv')
	csv = CSV.parse(csv_text, :headers => true, converters: :numeric)
	csv.each_with_index do |row, i|
		restaurant = Restaurant.find_by(permit_id: row["permit_id"])
	  inspection = Inspection.create!(
	    row.to_hash.except("permit_id").merge(restaurant: restaurant)
		  )
	end
	puts "inspection data imported!"


	puts "importing Violations Key/Potential Violations data!"
	csv_text = File.read('db/violations_key.csv')
	csv = CSV.parse(csv_text, :headers => true, converters: :numeric)
	csv.each do |row|
		PotentialViolation.create!(row.to_hash)
	end
	puts "violation keys imported!"

	puts "importing violation data!"
	csv_text = File.read('db/violations.csv')
	csv = CSV.parse(csv_text, :headers => true, :converters => :all)
	csv.each do |row|
	  # row_hash = row.to_hash
		inspection = Inspection.find_by(inspection_ref: row["inspection_ref"])
		potential_violation = PotentialViolation.find_by(violation_number: row["violation_number"])
		violation = Violation.create!(row.to_hash.slice("violation_text").merge(inspection: inspection, potential_violation: potential_violation)
			)
	end
	"Violation data imported!"

