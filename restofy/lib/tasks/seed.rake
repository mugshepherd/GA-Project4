namespace :seed do
  desc "TODO"
  task resto_seed: :environment do
    puts "seeding database!"
  	puts "importing restaurant data!"
  	require 'csv'    
		csv_text = File.read('db/restaurants.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		  Restaurant.create!(row.to_hash)
		end

# ## r = Restaurant.find_by(permit_id: o.permit_id)
# ## r.yelp_id = o.yelp_id
# ## r.save!
# ## end
		puts "restaurants created!"

		#create inspection records
		puts "importing inspection data!"
		csv_text = File.read('db/inspections.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		  Inspection.create!(row.to_hash.except("permit_id"), row.restaurant = Restaurant.find_by(id: row.permit_id))
		end

		puts "inspection data imported!"


		puts "importing Violations Key/Potential Violations data!"
		csv_text = File.read('db/violations_key.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			PotentialViolation.create!(row.to_hash)
		end
		puts "violation keys imported!"

		puts "importing violation data!"
		csv_text = File.read('db/violations.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		Violation.create!(row.to_hash)
		end
		"Violation data imported!"

  end

end
