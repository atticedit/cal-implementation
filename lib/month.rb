class Month

  MAX_ROWS_IN_MONTH = 6
  DAYS_IN_WEEK = 7
  MONTH_OUTPUT_WIDTH = 20

  MONTHS = ["January", "February", "March",
            "April", "May", "June",
            "July", "August", "September",
            "October", "November", "December"]

  def initialize month_number, year
    last_days = [31,28,31,30,31,30,31,31,30,31,30,31]
    @month_number = month_number
    unless (1..12).include? month_number
      raise ArgumentError,
      "#{month_number} is neither a month number nor a name"
    end
    if year < 1800 || year > 3000
      raise ArgumentError,
      "Year must be within the range of 1800–3000"
    end
    indexed_month = (month_number - 1)
    @month_name = MONTHS[indexed_month]
    @year = year
    last_day = last_days[indexed_month]
    if @month_name == "February"
      last_day = Year.new(year).february_length
    end
    calendar_values = (1..last_day).to_a
    offset_of_day_one = find_offset_of_day_one
    offsets = (["  "] * offset_of_day_one)
    calendar_values.unshift(offsets).flatten!

    positions = Array.new
    (DAYS_IN_WEEK * MAX_ROWS_IN_MONTH).times do |i|
      calendar_value = calendar_values[i].to_s.rjust(2)
      positions << calendar_value
    end

    @row_0 = positions[ 0.. 6].join(" ") { |x| print x}
    @row_1 = positions[ 7..13].join(" ") { |x| print x}
    @row_2 = positions[14..20].join(" ") { |x| print x}
    @row_3 = positions[21..27].join(" ") { |x| print x}
    @row_4 = positions[28..34].join(" ") { |x| print x}
    @row_5 = positions[35..41].join(" ") { |x| print x}

  end

  attr_reader :row_0, :row_1, :row_2,
              :row_3, :row_4, :row_5

  def header
    "#{@month_name} #{@year}"
    .center(MONTH_OUTPUT_WIDTH).rstrip
  end

  def dayline
    "Su Mo Tu We Th Fr Sa"
  end

  def find_offset_of_day_one
    month = @month_number
    year = @year

    # define January and February as the 13th and 14th
    # months of the previous year, per Zeller's congruence
    # http://en.wikipedia.org/wiki/Zeller's_congruence
    case month
    when 1 then month = 13 and year -= 1
    when 2 then month = 14 and year -= 1
    end

    # implement a special case of Zeller's congruence to
    # find the day of the week of the 1st of the month,
    # using Zeller's value assignments that start with
    # 0 for Saturday
    day_of_week = (1 + (26 * (month + 1)/10) +
      year + (year/4) + (6 * (year/100)) +
      (year/400)).modulo(7)
    # set Saturday to a value of 7 (to end the week)
    # instead of Zeller's value of 0 (to start the week)
    day_of_week = 7 if day_of_week == 0
    # shift values from a 1-7 range to a 0-6 range
    # (matching the number of positions from the left the
    # 1st day of the month should be offset when
    # displaying a month)
    day_of_week - 1
  end

end
