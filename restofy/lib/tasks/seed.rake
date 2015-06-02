namespace :seed do
  desc "TODO"
  task resto_seed: :environment do
    puts "database seeded!"
  	require 'csv'    
		csv_text = File.read('db/restaurants.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
		  Restaurant.create!(row.to_hash)
		end
  end

end
