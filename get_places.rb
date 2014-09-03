require 'json'


file = File.read('json/zoe_places_20140902.json')
data_hash = JSON.parse(file)

zoe_places = []

json_strings = data_hash.length

json_strings.times do |json_part|

	segments = data_hash[json_part]['segments']

	segments.each_with_index do |val, i|

		startTime = segments[i]['startTime']
		endTime = segments[i]['endTime']
		place = segments[i]['place']
		place_id = segments[i]['place']['id']
		place_lat = place['location']['lat']
		place_lon = place['location']['lon']

		puts
		puts "Moves place id: #{place_id}"
		puts "Start time: #{startTime}"
		puts "End time: #{endTime}"
		puts "#{place_lat}, #{place_lon}"


		hash =  {
			place_id: place_id,
			start_time: startTime,
			end_time: endTime,
			place_lat: place_lat,
			place_lon: place_lon
		}

		zoe_places << hash

	end

end

puts
puts
puts zoe_places