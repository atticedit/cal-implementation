class Year

  # refactor to remove these magic numbers
  MONTH_OUTPUT_WIDTH = 20
  YEAR_OUTPUT_PADDING = 29
  GUTTER = "  "

  @@months = ["January","February","March","April","May","June","July","August","September","October","November","December"]

  def initialize year
    if year < 1800 || year > 3000
      raise ArgumentError, "Year must be within the range of 1800–3000"
    end
    @year = year

  end

  def february_length
    # February has 28 days if the year is not divisible by 4
    if @year % 4 != 0
      28
    # February has 28 days if the year is divisible by 100 but not by 400
    elsif (@year % 100 == 0) && (@year % 400 != 0)
      28
    # February has 29 days if neither of the above is true
    else
      29
    end
  end

  def header
    year_header = "#{@year}"
    year_padding = (" " * YEAR_OUTPUT_PADDING)
    year_padding + year_header
  end

  def monthline index
    s = String.new
    (1..3).each do |i|
      month = @@months[index].to_s
      padding = (" " * ((MONTH_OUTPUT_WIDTH - month.size)/2))
      s << padding + month
      unless i == 3
        if month.size % 2 != 0
          padding = padding + " "
        end
        s << padding + GUTTER
      end
      index += 1
    end
    s
  end

  def dayline
    (("Su Mo Tu We Th Fr Sa" + GUTTER) * 3).rstrip
  end

end
