require_relative 'lib/month'
require_relative 'lib/year'
begin

  # for the case where 2 arguments, a month and a year, are passed in:
  if ARGV.length == 2

    # define variables
    year = ARGV[1].to_i
    numeric_month = ARGV[0].to_i
    month = Month.new(numeric_month, year)

    # display the month's header
    puts month.header

    # display the month
    puts month.dayline

    puts month.line_0
    puts month.line_1
    puts month.line_2
    puts month.line_3
    puts month.line_4.rstrip
    puts month.line_5.rstrip
  end

  # # for the case where 1 argument, a year, is passed in:
  if ARGV.length == 1

    # define variables
    year = Year.new ARGV[0].to_i

    # display the year's label
    puts year.label

    4.times do |i|
      # display the year's header
      print year.header

      # display the year
      puts year.dayline
      # puts year.block_1
    end
  end

end
