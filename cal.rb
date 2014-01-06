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

    # display the dayline
    puts month.dayline

    # display the month
    puts month.line_0
    puts month.line_1
    puts month.line_2
    puts month.line_3
    puts month.line_4.rstrip # strip the trailing whitespaces from lines that potentially have them
    puts month.line_5.rstrip
  end

  # for the case where 1 argument, a year, is passed in:
  if ARGV.length == 1

    # define variables
    year = Year.new ARGV[0].to_i

    # display the year's header
    puts year.header
    puts

    # display each 3-month block
    index = 0
    4.times do |i|
      # display the monthline
      puts year.monthline index

      # display the dayline
      puts year.dayline

      # display the month block
      puts year.send("block_#{i}")
      index += 3
    end
  end

end
