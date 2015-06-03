# encoding: utf-8

require 'csv'
	#importing restaurant data
	puts "importing restaurants"
	CSV.foreach("db/restaurants.csv", :headers => true) do |row|
	  Restaurant.create!(row.to_hash)
	end
	puts "restaurants imported"

	#appending yelp_id to restaurant data
	puts "importing yelp_ID"
	CSV.foreach("db/yelp_crosswalk.csv", :headers => true, :encoding => 'ISO-8859-1') do |row|
		restaurant = Restaurant.find_by(permit_id: row.to_hash["permit_id"])
		restaurant.update(row.to_hash.slice("yelp_id"))
	end
	puts "yahoo id imported"

	#importing inspection records
	puts "importing inspection data!"
	CSV.foreach("db/inspections.csv", :headers => true) do |row|
		restaurant = Restaurant.find_by(permit_id: row["permit_id"])
	  inspection = Inspection.create!(
	    row.to_hash.except("permit_id").merge(restaurant: restaurant)
		  )
	end
	puts "inspection data imported!"

	#importing violations key data
	puts "importing Violations Key/Potential Violations data!"
	CSV.foreach("db/violations_key.csv", :headers => true) do |row|
		PotentialViolation.create!(row.to_hash)
	end
	puts "violation keys imported!"

	#importing violation data
	puts "importing violation data!"
	CSV.foreach("db/violations.csv", :headers => true) do |row|
	  # row_hash = row.to_hash
		inspection = Inspection.find_by(inspection_ref: row["inspection_ref"])
		potential_violation = PotentialViolation.find_by(violation_number: row["violation_number"])
		violation = Violation.create!(row.to_hash.slice("violation_text").merge(inspection: inspection, potential_violation: potential_violation)
			)
	end
	puts "Violation data imported!"
	puts "import completed"