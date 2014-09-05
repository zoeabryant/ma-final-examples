require 'date'
require 'geo-distance'

tom_steps = [
	{:lat=>51.5231363599, :lon=>-0.0866050985, :time=>"20140902T132353+0100"},
	{:lat=>51.523356047, :lon=>-0.093021273, :time=>"20140902T133118+0100"},
	{:lat=>51.5228695109, :lon=>-0.0868733159, :time=>"20140902T153044+0100"},
	{:lat=>51.5229869823, :lon=>-0.0869381918, :time=>"20140902T153108+0100"},
	{:lat=>51.5230132462, :lon=>-0.086968415, :time=>"20140902T153129+0100"},
	{:lat=>51.5230247378, :lon=>-0.0869788866, :time=>"20140902T153145+0100"},
	{:lat=>51.5248418443, :lon=>-0.0862373634, :time=>"20140902T153502+0100"},
	{:lat=>51.5248418443, :lon=>-0.0862373634, :time=>"20140902T153550+0100"},
	{:lat=>51.5230586839, :lon=>-0.0865467919, :time=>"20140902T154251+0100"},
	{:lat=>51.5228695109, :lon=>-0.0868733159, :time=>"20140902T154404+0100"},
	{:lat=>51.5232323785, :lon=>-0.087081375, :time=>"20140902T182153+0100"},
	{:lat=>51.5217309885, :lon=>-0.12256495, :time=>"20140902T182943+0100"},
	{:lat=>51.5212949114, :lon=>-0.134186273, :time=>"20140902T183553+0100"},
	{:lat=>51.5189215295, :lon=>-0.1880730213, :time=>"20140902T184409+0100"},
	{:lat=>51.5189215295, :lon=>-0.1880730213, :time=>"20140902T184409+0100"},
	{:lat=>51.5190677745, :lon=>-0.1883148932, :time=>"20140902T184426+0100"},
	{:lat=>51.5190970557, :lon=>-0.188356267, :time=>"20140902T184448+0100"},
	{:lat=>51.5180004754, :lon=>-0.1917838643, :time=>"20140902T184802+0100"},
	{:lat=>51.5179818178, :lon=>-0.1920434026, :time=>"20140902T184817+0100"},
	{:lat=>51.5180458496, :lon=>-0.1924315725, :time=>"20140902T184833+0100"},
	{:lat=>51.5179404734, :lon=>-0.1929225465, :time=>"20140902T184852+0100"},
	{:lat=>51.5177926492, :lon=>-0.1931886002, :time=>"20140902T184915+0100"},
	{:lat=>51.5174493285, :lon=>-0.1937833329, :time=>"20140902T185001+0100"},
	{:lat=>51.5165855528, :lon=>-0.1953717099, :time=>"20140902T185205+0100"},
	{:lat=>51.5166191523, :lon=>-0.1951915039, :time=>"20140902T185221+0100"},
	{:lat=>51.5165707896, :lon=>-0.1951217764, :time=>"20140902T185241+0100"},
	{:lat=>51.51640909, :lon=>-0.1950001082, :time=>"20140902T185304+0100"},
	{:lat=>51.5164090572, :lon=>-0.1950000814, :time=>"20140902T185403+0100"},
	{:lat=>51.5178015998, :lon=>-0.2123810727, :time=>"20140902T210936+0100"},
	{:lat=>51.5179177385, :lon=>-0.2120866466, :time=>"20140902T210956+0100"},
	{:lat=>51.5179999252, :lon=>-0.2115470617, :time=>"20140902T211012+0100"},
	{:lat=>51.5181051963, :lon=>-0.2110679702, :time=>"20140902T211029+0100"},
	{:lat=>51.5173399407, :lon=>-0.2079565443, :time=>"20140902T211336+0100"},
	{:lat=>51.5173775618, :lon=>-0.2076857965, :time=>"20140902T211351+0100"},
	{:lat=>51.517519989, :lon=>-0.20711767, :time=>"20140902T211415+0100"},
	{:lat=>51.5175779023, :lon=>-0.2065722538, :time=>"20140902T211438+0100"},
	{:lat=>51.5174929045, :lon=>-0.2030743619, :time=>"20140902T211734+0100"},
	{:lat=>51.5174784314, :lon=>-0.2026618604, :time=>"20140902T211750+0100"},
	{:lat=>51.5176524188, :lon=>-0.2021800952, :time=>"20140902T211813+0100"},
	{:lat=>51.5178072395, :lon=>-0.2018384818, :time=>"20140902T211830+0100"},
	{:lat=>51.5179666135, :lon=>-0.2012242391, :time=>"20140902T211900+0100"},
	{:lat=>51.518161944, :lon=>-0.2005272316, :time=>"20140902T211929+0100"},
	{:lat=>51.5190177097, :lon=>-0.1971771168, :time=>"20140902T212146+0100"},
	{:lat=>51.518955703, :lon=>-0.1967129629, :time=>"20140902T212205+0100"},
	{:lat=>51.5188497404, :lon=>-0.196128438, :time=>"20140902T212226+0100"},
	{:lat=>51.5178159118, :lon=>-0.196084552, :time=>"20140902T212531+0100"},
	{:lat=>51.5165906579, :lon=>-0.1954451964, :time=>"20140902T212553+0100"},
	{:lat=>51.5165886111, :lon=>-0.1953749299, :time=>"20140902T212609+0100"},
	{:lat=>51.5165629097, :lon=>-0.1954945875, :time=>"20140902T212630+0100"}
]

tom_places = [
	{:place_id=>152423309, :start_time=>"20140902T074027+0100", :end_time=>"20140902T083008+0100", :lat=>51.4960936203, :lon=>0.0129008829},
	{:place_id=>152321929, :start_time=>"20140902T091320+0100", :end_time=>"20140902T105444+0100", :lat=>51.5230885975, :lon=>-0.0870480194}
]

zoe_steps = [
	{:lat=>51.4960936203, :lon=>0.0129008829, :time=>"20140902T083008+0100"},
	{:lat=>51.4958643302, :lon=>0.0126906463, :time=>"20140902T083058+0100"},
	{:lat=>51.4957469585, :lon=>0.0125437965, :time=>"20140902T083140+0100"},
	{:lat=>51.4955315121, :lon=>0.0122723257, :time=>"20140902T083220+0100"},
	{:lat=>51.4955920494, :lon=>0.0117988624, :time=>"20140902T083241+0100"},
	{:lat=>51.4956338814, :lon=>0.0113553066, :time=>"20140902T083304+0100"},
	{:lat=>51.4960540526, :lon=>0.0106273785, :time=>"20140902T083338+0100"},
	{:lat=>51.4964852508, :lon=>0.010320832, :time=>"20140902T083406+0100"},
	{:lat=>51.4967923493, :lon=>0.0101075537, :time=>"20140902T083426+0100"},
	{:lat=>51.4976599673, :lon=>0.009529091, :time=>"20140902T083508+0100"},
	{:lat=>51.4977892859, :lon=>0.0093964175, :time=>"20140902T083525+0100"},
	{:lat=>51.4978253288, :lon=>0.0091568121, :time=>"20140902T083546+0100"},
	{:lat=>51.4979115476, :lon=>0.0088712708, :time=>"20140902T083602+0100"},
	{:lat=>51.4981933138, :lon=>0.0086041968, :time=>"20140902T083624+0100"},
	{:lat=>51.4984083424, :lon=>0.0083023435, :time=>"20140902T083642+0100"},
	{:lat=>51.4991696702, :lon=>0.0076830719, :time=>"20140902T083718+0100"},
	{:lat=>51.5000931577, :lon=>0.0069603177, :time=>"20140902T083807+0100"},
	{:lat=>51.5002952111, :lon=>0.006701468, :time=>"20140902T083823+0100"},
	{:lat=>51.5005811771, :lon=>0.006076539, :time=>"20140902T083847+0100"},
	{:lat=>51.5008272228, :lon=>0.0055546008, :time=>"20140902T083912+0100"},
	{:lat=>51.5009240314, :lon=>0.0052631161, :time=>"20140902T083935+0100"},
	{:lat=>51.5007384072, :lon=>0.00538294, :time=>"20140902T083953+0100"},
	{:lat=>51.5008611187, :lon=>0.0051679139, :time=>"20140902T084013+0100"},
	{:lat=>51.5007010622, :lon=>0.00480254, :time=>"20140902T084032+0100"},
	{:lat=>51.500558647, :lon=>0.0044950877, :time=>"20140902T084048+0100"},
	{:lat=>51.5005612955, :lon=>0.0042046131, :time=>"20140902T084112+0100"},
	{:lat=>51.5004195035, :lon=>0.0039627324, :time=>"20140902T084131+0100"},
	{:lat=>51.500273369, :lon=>0.0036780803, :time=>"20140902T084157+0100"},
	{:lat=>51.5002425813, :lon=>0.0035884843, :time=>"20140902T084220+0100"},
	{:lat=>51.5002438185, :lon=>0.0035499456, :time=>"20140902T084243+0100"},
	{:lat=>51.5002546757, :lon=>0.0035053646, :time=>"20140902T084311+0100"},
	{:lat=>51.5002546757, :lon=>0.0035053646, :time=>"20140902T084311+0100"},
	{:lat=>51.5002841968, :lon=>0.0034016618, :time=>"20140902T084340+0100"},
	{:lat=>51.4980582826, :lon=>-0.0497296219, :time=>"20140902T084814+0100"},
	{:lat=>51.4983513271, :lon=>-0.0499599156, :time=>"20140902T084834+0100"},
	{:lat=>51.4983954224, :lon=>-0.0499916467, :time=>"20140902T084901+0100"},
	{:lat=>51.4984321504, :lon=>-0.050019166, :time=>"20140902T084918+0100"},
	{:lat=>51.4984948812, :lon=>-0.0500662383, :time=>"20140902T085000+0100"},
	{:lat=>51.5006348507, :lon=>-0.0516537448, :time=>"20140902T085141+0100"},
	{:lat=>51.5229604907, :lon=>-0.0702623141, :time=>"20140902T085811+0100"},
	{:lat=>51.5233479141, :lon=>-0.0752896951, :time=>"20140902T085834+0100"},
	{:lat=>51.523504279, :lon=>-0.0756042129, :time=>"20140902T085852+0100"},
	{:lat=>51.5235157478, :lon=>-0.0756160806, :time=>"20140902T085912+0100"},
	{:lat=>51.5235157478, :lon=>-0.0756160806, :time=>"20140902T085912+0100"},
	{:lat=>51.5235218943, :lon=>-0.0756220562, :time=>"20140902T085936+0100"},
	{:lat=>51.5235292071, :lon=>-0.075624097, :time=>"20140902T085957+0100"},
	{:lat=>51.5235298243, :lon=>-0.0756230535, :time=>"20140902T085959+0100"},
	{:lat=>51.5235298274, :lon=>-0.0756230484, :time=>"20140902T090000+0100"},
	{:lat=>51.5235354517, :lon=>-0.0756135392, :time=>"20140902T090018+0100"},
	{:lat=>51.5235421282, :lon=>-0.0755867605, :time=>"20140902T090039+0100"},
	{:lat=>51.5235706419, :lon=>-0.0755593656, :time=>"20140902T090117+0100"},
	{:lat=>51.5236053866, :lon=>-0.0757580847, :time=>"20140902T090132+0100"},
	{:lat=>51.5236559429, :lon=>-0.0761830994, :time=>"20140902T090151+0100"},
	{:lat=>51.5236470379, :lon=>-0.076514932, :time=>"20140902T090207+0100"},
	{:lat=>51.5236808313, :lon=>-0.076914856, :time=>"20140902T090222+0100"},
	{:lat=>51.5237464775, :lon=>-0.0771586024, :time=>"20140902T090238+0100"},
	{:lat=>51.5238309965, :lon=>-0.0771646728, :time=>"20140902T090255+0100"},
	{:lat=>51.5238089859, :lon=>-0.0774856876, :time=>"20140902T090310+0100"},
	{:lat=>51.5238026177, :lon=>-0.0779151089, :time=>"20140902T090326+0100"},
	{:lat=>51.5237798722, :lon=>-0.0784368629, :time=>"20140902T090348+0100"},
	{:lat=>51.5237791481, :lon=>-0.0789134274, :time=>"20140902T090411+0100"},
	{:lat=>51.5237842552, :lon=>-0.0792098397, :time=>"20140902T090448+0100"},
	{:lat=>51.5238385442, :lon=>-0.0794959951, :time=>"20140902T090511+0100"},
	{:lat=>51.5238440985, :lon=>-0.079855998, :time=>"20140902T090534+0100"},
	{:lat=>51.5237159522, :lon=>-0.0801619281, :time=>"20140902T090557+0100"},
	{:lat=>51.5235434995, :lon=>-0.0803945122, :time=>"20140902T090615+0100"},
	{:lat=>51.5235245879, :lon=>-0.0809667218, :time=>"20140902T090635+0100"},
	{:lat=>51.5233159513, :lon=>-0.0816403387, :time=>"20140902T090702+0100"},
	{:lat=>51.5232911256, :lon=>-0.0822995446, :time=>"20140902T090723+0100"},
	{:lat=>51.5233074676, :lon=>-0.0831010519, :time=>"20140902T090746+0100"},
	{:lat=>51.5233375386, :lon=>-0.0839156366, :time=>"20140902T090821+0100"},
	{:lat=>51.5233545427, :lon=>-0.0841554928, :time=>"20140902T090838+0100"},
	{:lat=>51.5233741918, :lon=>-0.0845433966, :time=>"20140902T090858+0100"},
	{:lat=>51.5233852591, :lon=>-0.0847967969, :time=>"20140902T090921+0100"},
	{:lat=>51.5233986566, :lon=>-0.0849970732, :time=>"20140902T090937+0100"},
	{:lat=>51.5233985732, :lon=>-0.0853189254, :time=>"20140902T090958+0100"},
	{:lat=>51.5234133864, :lon=>-0.0856155243, :time=>"20140902T091018+0100"},
	{:lat=>51.5234931482, :lon=>-0.0860372142, :time=>"20140902T091038+0100"},
	{:lat=>51.5233237338, :lon=>-0.0862481631, :time=>"20140902T091053+0100"},
	{:lat=>51.5232838178, :lon=>-0.0867871391, :time=>"20140902T091115+0100"},
	{:lat=>51.5231698822, :lon=>-0.086980553, :time=>"20140902T091131+0100"},
	{:lat=>51.5230967158, :lon=>-0.0870227664, :time=>"20140902T091148+0100"},
	{:lat=>51.5231294412, :lon=>-0.0869860472, :time=>"20140902T091211+0100"},
	{:lat=>51.5231507047, :lon=>-0.0869999344, :time=>"20140902T091234+0100"},
	{:lat=>51.5231412816, :lon=>-0.0869939907, :time=>"20140902T091257+0100"},
	{:lat=>51.5230885975, :lon=>-0.0870480194, :time=>"20140902T091320+0100"}
]

zoe_places = [
	{:place_id=>152423309, :start_time=>"20140902T074027+0100", :end_time=>"20140902T083008+0100", :lat=>51.4960936203, :lon=>0.0129008829},
	{:place_id=>152321929, :start_time=>"20140902T091320+0100", :end_time=>"20140902T105444+0100", :lat=>51.5230885975, :lon=>-0.0870480194}
]

date = "20140902"
date_ob = Time.new(2014, 9, 02, 0)

@matches = []
@time_line = {}

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


def run_and_format_time_for array
	array.each do |step|
		step[:time] = format_time(step[:time])
	end
end

def format_placetime array
	array.each do |step|
		step[:start_time] = format_time(step[:start_time])
		step[:end_time] = format_time(step[:end_time])
	end
end


def relevant_time? data_time, current_time
	current_time <= data_time && data_time < (add_five_minutes current_time)
end


def relevant_placetime? place_start_time, place_end_time, timeslot_start
	# timeslot_start # current time slot start (9:00)
	timeslot_end = add_five_minutes(timeslot_start) # (9:05)
	# place_start_time # (9:01)
	# place_end_time # (9:09)

	# timeslot_start <= place_end_time 

	(place_start_time >= timeslot_start && place_start_time < timeslot_end) || (place_start_time < timeslot_start && place_end_time > timeslot_start)

	# && timeslot_start >= place_start_time
	# data_time == current_time
end


def add_five_minutes time
	time + 300
end


def make_a_timeline_for tom_steps, tom_places, date

	next_day = date + (60 * 60 * 24)

	while date != next_day do
		
		@time_line[date] = []

		tom_steps.select do |step|
			
			if relevant_time?(step[:time], date)

				@time_line[date] << step

			end
		end

		tom_places.select do |place|
			if relevant_placetime?(place[:start_time], place[:end_time], date)

				@time_line[date] << [place]

			end
		end

		date = add_five_minutes date
	end

	@time_line

end

tom_formatted_steps = run_and_format_time_for tom_steps
tom_formatted_places = format_placetime tom_places

zoe_formatted_steps = run_and_format_time_for zoe_steps
zoe_formatted_places = format_placetime zoe_places

tom_timeline = make_a_timeline_for tom_formatted_steps, tom_formatted_places, date_ob
zoe_timeline = make_a_timeline_for zoe_formatted_steps, zoe_formatted_places, date_ob

def compare timeline1, timeline2

	start_time = Time.now

	count = 0

	timeline1.each do | timeslot |

		timeslot[1].flatten.each do |position|

			u1_current_lat = position[:lat]
			u1_current_lon = position[:lon]
			
			position[:time] ? u1_current_time = position[:time] : u1_current_time = timeslot[0]

				p u1_current_time
				p u1_current_lon
				p u1_current_lat

				timeline2.each do | timeslot |

					timeslot[1].flatten.each do |position|

						u2_current_lat = position[:lat]
						u2_current_lon = position[:lon]

						position[:time] ? u2_current_time = position[:time] : u2_current_time = timeslot[0]

							calculate_comparison(u1_current_lat, u1_current_lon, u1_current_time, u2_current_lat, u2_current_lon, u2_current_time)
					
					end
				end

		end

		count = count + 1


	end

	# summary user1, user2, count, start_time

end

def calculate_comparison u1_lat, u1_lon, u1_time, u2_lat, u2_lon, u2_time

	distance_between = distance_between(u1_lat, u1_lon, u2_lat, u2_lon)
	time_between = time_between(u1_time, u2_time)

	if did_they_bump?(distance_between, time_between)

		puts
		puts
		puts "User one at #{u1_time}"
		puts "#{u1_lat}, #{u1_lon}"
		puts
		puts "User two at #{u2_time}"
		puts "#{u2_lat}, #{u2_lon}"
		save_bump(distance_between, time_between)
	end

end

@bumps = []
@distances = []

include Math

	R = 6367.45  # radius of the Earth, in kilometers

	def deg2rad(lat, lon) # converts degrees to radians
	  [lat * PI / 180, lon * PI / 180]
	end
	 
	def distance_between(lat1, lon1, lat2, lon2)
	  radlat1, radlon1 = deg2rad(lat1, lon1)
	  radlat2, radlon2 = deg2rad(lat2, lon2)
	  2 * R * asin(sqrt(sin((radlat2-radlat1)/2)**2 + cos(radlat1) * cos(radlat2) * sin((radlon2 - radlon1)/2)**2)) # Haversine formula
	end

# def distance_between lat1, lon1, lat2, lon2
# 	dist = GeoDistance::Haversine.geo_distance( lat1, lon1, lat2, lon2 )
# 	# puts "the distance from  #{lat1}, #{lon1} to #{lat2}, #{lon2} is: #{dist.meters} meters"

# 	@distances << dist.meters
# 	dist.meters
# end

def time_between u1_time, u2_time
	# u1_time = format_time(u1_time)
	# u2_time = format_time(u2_time)

	(u1_time - u2_time).abs
end

def did_they_bump? distance_between, time_between
	outer_limit = 15 #m
	inner_limit = 5
	max_time = 300.0 #seconds
	(distance_between < outer_limit && distance_between > inner_limit) && time_between < max_time
end

def save_bump distance_between, time_between
	puts
	puts "Distance between: #{distance_between}"
	puts "Time between: #{time_between}"

	puts 'Bump!'

	bump = {distance: distance_between, time: time_between}
	@bumps << bump
	# Bump.new(distance: distance_between, time: time_between)
end

def calculate_comparison u1_lat, u1_lon, u1_time, u2_lat, u2_lon, u2_time

	distance_between = distance_between(u1_lat, u1_lon, u2_lat, u2_lon)
	time_between = time_between(u1_time, u2_time)

	if did_they_bump?(distance_between, time_between)

		puts
		puts
		puts "User one at #{u1_time}"
		puts "#{u1_lat}, #{u1_lon}"
		puts
		puts "User two at #{u2_time}"
		puts "#{u2_lat}, #{u2_lon}"
		save_bump(distance_between, time_between)
	end

end

def summary user1, user2, count, start_time
	elapsed = Time.now - start_time
	puts
	puts '-' * 20
	puts "Script started at: #{start_time}"
	puts "It took #{elapsed} seconds"
	puts "Ran through #{user1.length} steps for user one"
	puts "Ran through #{user2.length} steps for user two"
	puts "Closest people got was #{@distances.min} meters"
	puts "Ran through a total of #{count} times"
	puts "Found #{@bumps.length} bumps"
	puts
end

compare tom_timeline, zoe_timeline

