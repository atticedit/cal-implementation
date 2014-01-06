require_relative 'lib/month'
require_relative 'lib/year'
begin

  # define constants and variables
  MAX_WEEKS_IN_MONTH = 6
  DAYS_IN_WEEK = 7
  MONTH_OUTPUT_WIDTH = 20
  YEAR_OUTPUT_PADDING = 29

  $day_header = "Su Mo Tu We Th Fr Sa"
  $gutter = "  "

  months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
  last_days = [31,28,31,30,31,30,31,31,30,31,30,31]

  # for the case where 2 arguments, a month and a year, are passed in:
  if ARGV.length == 2

    # define variables
    year = ARGV[1].to_i
    numeric_month = ARGV[0].to_i

    unless (1..12).include? numeric_month
      raise ArgumentError, "#{ARGV[0]} is neither a month number (1..12) nor a name"
    end

    indexed_month = (numeric_month - 1)
    month = months[indexed_month]
    last_day = last_days[indexed_month]
    if numeric_month == 02
      last_day = (Year.new.february_length year)
    end
    header = "#{month} #{year}"
    padding = (" " * ((MONTH_OUTPUT_WIDTH - header.size)/2))
    days = (1..last_day).to_a
    offset_of_day_one = Month.new.find_offset_of_day_one year, numeric_month
    offset_of_day_one.times do
      days.unshift(" ")
    end
    day_divider = " "

    # display the month's header
    puts padding + header

    # display the month
    puts $day_header
    calendar = Array.new
    42.times do |i|
      calendar_line = String.new
      day = days[i].to_s
      if day.size == 1
        day = " #{day}"
      elsif day == ""
        day = "  "
      end
      calendar_line = day
      calendar << calendar_line
    end

    line0 = calendar[0..6].join(" ") { |x| print x}
    line1 = calendar[7..13].join(" ") { |x| print x}
    line2 = calendar[14..20].join(" ") { |x| print x}
    line3 = calendar[21..27].join(" ") { |x| print x}
    line4 = calendar[28..34].join(" ") { |x| print x}
    line5 = calendar[35..41].join(" ") { |x| print x}

    puts line0
    puts line1
    puts line2
    puts line3
    puts line4.rstrip
    puts line5.rstrip

  end

  # for the case where 1 argument, a year, is passed in:
  if ARGV.length == 1
    year = ARGV[0].to_i
    if year < 1800 || year > 3000
      puts "Year must be within the range of 1800–3000"
      exit
    end

    # define variables
    year_header = "#{year}"
    year_padding = (" " * YEAR_OUTPUT_PADDING)

    # display the year's header
    puts year_padding + year_header
    puts

    index = 0

    4.times do |k|
      3.times do |l|
        month = months[index]
        length_of_month_name = month.to_s.size
        padding = (" " * ((MONTH_OUTPUT_WIDTH - length_of_month_name)/2))
        print padding + month
        unless l == 2
          if length_of_month_name % 2 != 0
            print " "
          end
          print padding + $gutter
        end

        index += 1
      end
      puts
      puts (($day_header + $gutter) * 3).rstrip
    end
  end

end
