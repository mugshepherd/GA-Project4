class AllRestaurantLookup

	def fetch_restaurants
		HTTParty.get("http://grahamimac.com/inspectionmapper/allrest_id.php?callback=?`")
	end

	attr_accessor :name, :pid, :addr

	def initialize
		restaurants_hash = fetch_restaurants
		assign_values(restaurants_hash)
	end

	def assign_values(restaurant_hash)
		restaurants_all = restaurants_hash.parsed_response['results']
		self.name = restaurants_all['name']
		self.pid = restaurants_all['pid']
		self.addr = restaurants_all['addr']
	end

end
