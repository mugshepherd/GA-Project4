namespace :seed do
  desc "TODO"
  task resto_seed: :environment do
    puts "database seeded!"
  	require 'csv'    
		csv_text = File.read('db/restaurants.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|

# r = Restaurant.find_by(permit_id: o.permit_id)
# r.yelp_id = o.yelp_id
# r.save!
# end

		  Restaurant.create!(row.to_hash)
		end

		csv_text = File.read('db/inspections.csv')
		csv = CSV.parse(csv_text, :headers => true)
		inspections.each do |i|
			inspection = Inspection.create!(i)
			inspection.restaurant = Restaurant.find_by(id: i.restaurant_id)
			inspection.save!
		end

		csv_text = File.read('db/violations_key.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		PotentialViolation.create!(row.to_hash)
		end

		csv_text = File.read('db/violations.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		Violation.create!(row.to_hash)
		end

  end

end
