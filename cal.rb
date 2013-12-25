begin

  # accept between 0 and 3 arguments

  # if 0 arguments given:
  #   get current year and month
  #   use firstdayzeller method to find day of week of first day of the month
  #   if the month is February, determine if it has 29 days
  #     see if firstdayzeller for February 29 of that year throws error?
  #     see if firstdayzeller shows March 1 of that year is 2 days later than February 28?
  #     see if (year - 1) is divisible by 4, 100, and/or 400?
  #   display that month
  # * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  # note: the feature to accept 0 arguments would use the Date class, which is disallowed
  #   in the project requirements, but it's also a feature beyond what's required,
  #   implemented for better matching of cal's features

  # if 1 argument given:
  #   a year between 1800 and 3000
  # then:
  #   use firstdayzeller method to find day of week of January 1 that year
  #   determine if there are 29 days in February that year
  #   concatenate and display one line at a time of 3-month blocks:
  #     January, February, March
  #     April, May, June
  #     July, August, September
  #     October, November, December

  # if 2 arguments given:
  #   a month (e.g. 1, 01, jan, Jan, january, or January) and
  #   a year between 1800 and 3000
  # then:
  #   use firstdayzeller method to find day of week of January 1 that year
  #   if the month is February, determine if it has 29 days
  #   display that month

  # raise ArgumentError for year before 1800 or after 3000

  # match error message given by cal for incorrect format

end
