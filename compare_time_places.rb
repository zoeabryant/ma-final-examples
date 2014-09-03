require 'date'

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
# date_ob = DateTime.new(2014, 9, 02)
# date_ob = Date.new(2014, 9, 02)
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

def format_placetime array
	array.each do |step|
		step[:start_time] = format_time(step[:start_time])
		step[:end_time] = format_time(step[:end_time])
	end
end

def relevant_placetime? start_time, end_time, current_time
	current_time <= end_time && current_time >= start_time
	# data_time == current_time
end

def add_five_minutes time
	time + 300
end

# def floor(time, seconds = 60)
#     Time.at((time.to_f / seconds).floor * seconds)
# end

def make_a_timeline_for zoe_steps, zoe_places, date

	next_day = date + (60 * 60 * 24)

	while date != next_day do
		# hash[:item2] = 2

		# puts date

		# formatted_date = date.strftime "%Y%m%dT%H%M%S%z"
		# puts formatted_date
		@time_line[date] = []

		zoe_places.select do |place|
			# puts floor(step[:time], 300)
			if relevant_placetime?(place[:start_time], place[:end_time], date)

				@time_line[date] << place

				# @matches << step
			end
		end

		date = add_five_minutes date
	end

	puts '-'*20
	# puts "#{@matches.length} matches:"
	# puts

	# @matches.each_with_index do |val, i|
	# 	puts "#{i}. #{val[:time]}"
	# 	puts "#{val[:lat]}, #{val[:lon]}"
	# 	puts
	# end

	# puts '-'*20
	# puts "#{@matches.length} matches"
	# puts

	@time_line.each do |time_set, step|
		puts
		puts "#{time_set} #{'-' * 50}"
		puts step
		# puts "	#{step[:time]}: #{step[:lat]}, #{step[:lon]}"
	end


end

steps = format_placetime zoe_places

puts steps

make_a_timeline_for steps, zoe_places, date_ob
