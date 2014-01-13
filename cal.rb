require_relative 'lib/month'
require_relative 'lib/year'
begin

  NUMBER_OF_MONTHS_ACROSS = 3
  NUMBER_OF_MONTHS_DOWN = 4

  if ARGV.length == 2

    year = ARGV[1].to_i
    month_number = ARGV[0].to_i
    month = Month.new(month_number, year)

    puts month.header
    puts month.dayline
    puts month.row_0
    puts month.row_1
    puts month.row_2
    puts month.row_3
    puts month.row_4.rstrip
    puts month.row_5.rstrip
  end

  if ARGV.length == 1

    year = Year.new ARGV[0].to_i

    puts year.header
    puts
    index = 0
    NUMBER_OF_MONTHS_DOWN.times do |i|
      puts year.monthline index
      puts year.dayline
      puts year.send("quarter_#{i}")
      index += NUMBER_OF_MONTHS_ACROSS
    end
  end

end
