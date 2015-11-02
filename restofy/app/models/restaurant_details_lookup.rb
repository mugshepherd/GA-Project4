
class RestaurantDetailsLookup

	def fetch_weather
		HTTParty.get("http://api.wunderground.com/api/650aaf7a336f1f66/hourly/q/20001.xml")
	end

	attr_accessor :temperature, :icon

	def initialize
		weather_hash = fetch_weather
		assign_values(weather_hash)
	end

	def assign_values(weather_hash)
		hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
		self.temperature = hourly_forecast_response['temp']['english']
		self.icon = hourly_forecast_response['icon_url']
	end

end
