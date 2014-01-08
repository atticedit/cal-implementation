class Month

  MAX_WEEKS_IN_MONTH = 6
  DAYS_IN_WEEK = 7
  MONTH_OUTPUT_WIDTH = 20

  @@months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
  @@last_days = [31,28,31,30,31,30,31,31,30,31,30,31]

  def initialize numeric_month, year
    @numeric_month = numeric_month
    unless (1..12).include? numeric_month
      raise ArgumentError, "#{numeric_month} is neither a month number (1..12) nor a name"
    end
    if year < 1800 || year > 3000
      raise ArgumentError, "Year must be within the range of 1800–3000"
    end
    indexed_month = (numeric_month - 1)
    @spelled_month = @@months[indexed_month]
    @year = year
    last_day = @@last_days[indexed_month]
    if @spelled_month == "February"
      last_day = Year.new(year).february_length
    end
    calendar_values = (1..last_day).to_a
    offset_of_day_one = find_offset_of_day_one
    offset_of_day_one.times do
      calendar_values.unshift("  ")
    end

    positions = Array.new
    (DAYS_IN_WEEK * MAX_WEEKS_IN_MONTH).times do |i|
      calendar_value = calendar_values[i].to_s
      if calendar_value.size == 1
        calendar_value = " #{calendar_value}"
      elsif calendar_value == ""
        calendar_value = "  "
      end
      positions << calendar_value
    end

    @line_0 = positions[0..6].join(" ") { |x| print x}
    @line_1 = positions[7..13].join(" ") { |x| print x}
    @line_2 = positions[14..20].join(" ") { |x| print x}
    @line_3 = positions[21..27].join(" ") { |x| print x}
    @line_4 = positions[28..34].join(" ") { |x| print x}
    @line_5 = positions[35..41].join(" ") { |x| print x}
  end

  attr_reader:line_0,:line_1,:line_2,:line_3,:line_4,:line_5

  def header
    header = "#{@spelled_month} #{@year}"
    padding = (" " * ((MONTH_OUTPUT_WIDTH - header.size)/2))
    padding + header
  end

  def dayline
    "Su Mo Tu We Th Fr Sa"
  end

  def find_offset_of_day_one
    month = @numeric_month
    year = @year

    # define January and February as the 13th and 14th months of the previous year, per Zeller's congruence
    case month
    when 1 then month = 13 and year -= 1
    when 2 then month = 14 and year -= 1
    end

    # implement a special case of Zeller's congruence to find the day of the week of the 1st of the month,
    # using Zeller's value assignments that start with 0 for Saturday
    day_of_week = (1 + (26 * (month + 1)/10) + year + (year/4) + (6 * (year/100)) + (year/400)).modulo(7)
    # set Saturday to a value of 7 (to end the week) instead of Zeller's value of 0 (to start the week)
    day_of_week = 7 if day_of_week == 0
    # shift values from a 1-7 range to a 0-6 range (matching the number of positions from the left the
    # 1st day of the month should be offset when displaying a month)
    day_of_week - 1
  end

end
