#!/usr/bin/env ruby
require_relative 'lib/month'
begin

#   accept between 0 and 3 arguments

  # if 2 arguments given:
  if ["01", "1", "January", "Jan", "january", "jan"].include? arg1
    month = "January"
  elsif ["02", "2", "February", "Feb", "february", "feb"].include? arg1
    month = "February"
  elsif ["03", "3", "March", "Mar", "march", "mar"].include? arg1
    month = "March"
  elsif ["04", "4", "April", "Apr", "april", "apr"].include? arg1
    month = "April"
  elsif ["05", "5", "May", "may"].include? arg1
    month = "May"
  elsif ["06", "6", "June", "Jun", "june", "jun"].include? arg1
    month = "June"
  elsif ["07", "7", "July", "Jul", "july", "jul"].include? arg1
    month = "July"
  elsif ["08", "8", "August", "Aug", "august", "aug"].include? arg1
    month = "August"
  elsif ["09", "9", "September", "Sep", "september", "sep"].include? arg1
    month = "September"
  elsif ["10", "October", "Oct", "october", "oct"].include? arg1
    month = "October"
  elsif ["11", "November", "Nov", "november", "nov"].include? arg1
    month = "November"
  elsif ["12", "December", "Dec", "december", "dec"].include? arg1
    month = "December"
  else raise ArgumentError, "#{arg1} is neither a month number (1..12) nor a name"
  end
  year = arg2
  #   a month (e.g. 1, 01, jan, Jan, january, or January) and
  #   a year between 1800 and 3000
  # then:
  #   use first_day_zeller method to find day of week of first day of the month
  day_of_week_for_first_day = Month.new.first_day_zeller [year,month]
  #   if the month is February, determine how many days it has
  if month == "February"
    days_in_february = Year.new.february_length year
  end
  #   display that month
  puts "#{month} #{year}".center(20)
  puts "Su Mo Tu We Th Fr Sa"
  #   [continue printing out month]

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
