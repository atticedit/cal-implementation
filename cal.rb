require_relative 'lib/month'
require_relative 'lib/year'
begin

  # if 2 arguments given:
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  raise ArgumentError, 'Year must be within the range of 1800–3000' if year < 1800 || year > 3000

  # use first_day_zeller method to find day of week of first day of the month
  day_of_week_for_first_day = Month.new.first_day_zeller [year,month]

  case ARGV[0]
  when "01", "1"
    month = "January"
    last_day = 31
  when "02", "2"
    month = "February"
    last_day = Year.new.february_length year
  when "03", "3"
    month = "March"
    last_day = 31
  when "04", "4"
    month = "April"
    last_day = 30
  when "05", "5"
    month = "May"
    last_day = 31
  when "06", "6"
    month = "June"
    last_day = 30
  when "07", "7"
    month = "July"
    last_day = 31
  when "08", "8"
    month = "August"
    last_day = 31
  when "09", "9"
    month = "September"
    last_day = 30
  when "10"
    month = "October"
    last_day = 31
  when "11"
    month = "November"
    last_day = 30
  when "12"
    month = "December"
    last_day = 31
  else raise ArgumentError, "#{ARGV[0]} is neither a month number (1..12) nor a name"
  end

  # display that month
  puts "#{month} #{year}".center(20)
  puts "Su Mo Tu We Th Fr Sa"
  case day_of_week_for_first_day
  when 1
    days = (1..last_day)
    days.each do |i|
      if i.to_s.size == 1
        print " ", i, " "
      elsif i.to_s.size == 2
        print i, " "
      end
    end
    puts
  end

  #   # if 1 argument given:
#   #   a year between 1800 and 3000
#   # then:
#   #   use first_day_zeller method to find day of week of January 1 that year
#   day_of_week_for_first_day = Month.new.first_day_zeller [year,01]
#   #   determine how many days are in February that year
#   days_in_february = Year.new.february_length year
#   #   concatenate and display one line at a time of 3-month blocks:
#   #     January, February, March
#   #     April, May, June
#   #     July, August, September
#   #     October, November, December

#   # raise ArgumentError for year before 1800 or after 3000

#   # if 0 arguments given:
#   #   get current year and month
#   #   use first_day_zeller method to find day of week of first day of the month
#   day_of_week_for_first_day = Month.new.first_day_zeller [year,month]
#   #   if the month is February, determine how many days it has
#   if month = february
#     days_in_february = Year.new.february_length year
#   end
#   #   display that month
#   # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   # note: the feature to accept 0 arguments would use the Date class, which is disallowed
#   #   in the project requirements, but it's also a feature beyond what's required,
#   #   implemented for better matching of cal's features

end
