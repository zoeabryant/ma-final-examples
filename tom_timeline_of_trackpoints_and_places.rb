require 'date'

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

				@time_line[date] << place

			end
		end

		date = add_five_minutes date
	end

	puts '-'*20

	@time_line.each do |time_set, step|
		puts
		puts "#{time_set} #{'-' * 50}"
		puts step

	end

end

steps = run_and_format_time_for tom_steps

places = format_placetime tom_places

# make_a_timeline_for steps, places, date_ob

