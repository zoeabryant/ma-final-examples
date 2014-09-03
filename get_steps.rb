require 'json'


file = File.read('json/tom_20140902.json')
data_hash = JSON.parse(file)

# puts data_hash[0]['segments'][1]['activities'][0]['trackPoints']
# puts
json_strings = data_hash.length

json_strings.times do |json_part|

	segments = data_hash[json_part]['segments']

	segments.each_with_index do |val, i|

		activities = segments[i]['activities']

		if activities

			activities.each_with_index do |val, x|

				track_points = activities[x]['trackPoints']

				puts track_points

			end

		end

	end

end