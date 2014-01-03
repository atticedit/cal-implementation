require_relative 'lib/month'
require_relative 'lib/year'
begin

  # if 2 arguments given:
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  raise ArgumentError, 'Year must be within the range of 1800–3000' if year < 1800 || year > 3000

  # use identify_day_one method to find day of week of first day of the month
  day_of_week_for_day_one = Month.new.identify_day_one [year,month]

  case ARGV[0]
  when "01", "1" then month = "January"   and last_day = 31
  when "02", "2" then month = "February"  and last_day = (Year.new.february_length year)
  when "03", "3" then month = "March"     and last_day = 31
  when "04", "4" then month = "April"     and last_day = 30
  when "05", "5" then month = "May"       and last_day = 31
  when "06", "6" then month = "June"      and last_day = 30
  when "07", "7" then month = "July"      and last_day = 31
  when "08", "8" then month = "August"    and last_day = 31
  when "09", "9" then month = "September" and last_day = 30
  when "10"      then month = "October"   and last_day = 31
  when "11"      then month = "November"  and last_day = 30
  when "12"      then month = "December"  and last_day = 31
  else raise ArgumentError, "#{ARGV[0]} is neither a month number (1..12) nor a name"
  end

  days = (1..last_day).to_a
  (day_of_week_for_day_one - 1).times do
    days.unshift(0)
  end

  # display that month
  puts "#{month} #{year}".center(20)
  puts "Su Mo Tu We Th Fr Sa"
  days.each do |i|
    day = i.to_s
    day = "  " if day == "0"
    day = " " + day if day.size == 1
    print day, " "
  end
  puts

end
