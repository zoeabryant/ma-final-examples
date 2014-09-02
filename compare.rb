require 'geo-distance'

user1 = [
	{"lat"=>51.5165629097, "lon"=>-0.1954945875, "time"=>"20140831T124015+0100"},
	{"lat"=>51.5170749329, "lon"=>-0.1956915872, "time"=>"20140831T124133+0100"}
]

user2 = [
	{"lat"=>51.5192337937, "lon"=>-0.1953856004, "time"=>"20140831T131546+0100"},
	{"lat"=>51.5192164774, "lon"=>-0.1957913347, "time"=>"20140831T131602+0100"},
	{"lat"=>51.5191064241, "lon"=>-0.1962170577, "time"=>"20140831T131625+0100"},
	{"lat"=>51.5189830924, "lon"=>-0.1968190397, "time"=>"20140831T131659+0100"}
]


def distance_between lat1, lon1, lat2, lon2
	dist = GeoDistance::Haversine.geo_distance( lat1, lon1, lat2, lon2 )
	# puts "the distance from  #{lat1}, #{lon1} to #{lat2}, #{lon2} is: #{dist.meters} meters"
	dist.meters
end

def format_time time_string
	year = time_string[0..3]
	month =  time_string[4..5]
	day = time_string[6..7]

	hour = time_string[9..10]
	minutes = time_string[11..12]
	seconds = time_string[13..14]

	time_zone_hour = time_string[15..17]
	time_zone_minute = time_string[18..19]
	time_zone = "#{time_zone_hour}:#{time_zone_minute}"

	Time.new(year, month, day, hour, minutes, seconds, time_zone)
end

def time_between u1_time, u2_time
	u1_time = format_time(u1_time)
	u2_time = format_time(u2_time)

	(u1_time - u2_time).abs
end

def did_they_bump? distance_between, time_between
	max_distance = 227 #m
	max_time = 2200 #seconds
	distance_between < max_distance && time_between < max_time
end

def save_bump distance_between, time_between
	puts 'Bump!'
	# Bump.new(distance: distance_between, time: time_between)
end

def calculate_comparison u1_lat, u1_lon, u1_time, u2_lat, u2_lon, u2_time

	distance_between = distance_between(u1_lat, u1_lon, u2_lat, u2_lon)
	time_between = time_between(u1_time, u2_time)

	# puts
	# puts distance_between
	# puts time_between
	# puts did_they_bump?(distance_between, time_between)

	if did_they_bump?(distance_between, time_between)
		save_bump(distance_between, time_between)
	end

end

def compare user1, user2

	user1.each do | position|

		u1_current_lat = position['lat']
		u1_current_lon = position['lon']
		u1_current_time = position['time']

		user2.each do | position |

			u2_current_lat = position['lat']
			u2_current_lon = position['lon']
			u2_current_time = position['time']

			calculate_comparison(u1_current_lat, u1_current_lon, u1_current_time, u2_current_lat, u2_current_lon, u2_current_time)
		end

	end

end

compare user1, user2
# compare tom_steps, zoe_steps