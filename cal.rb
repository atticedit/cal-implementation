#!/usr/bin/env ruby
require_relative 'lib/month'
begin

#   accept between 0 and 3 arguments

#   # if 2 arguments given:
#   #   a month (e.g. 1, 01, jan, Jan, january, or January) and
#   #   a year between 1800 and 3000
#   # then:
#   #   use first_day_zeller method to find day of week of January 1 that year
#   day_of_week_for_first_day = Month.new.first_day_zeller [year,01]
#   #   if the month is February, determine how many days it has
#   if month = february
#     days_in_february = Year.new.february_length year
#   end
#   #   display that month

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

#   # match error message given by cal for incorrect format

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
