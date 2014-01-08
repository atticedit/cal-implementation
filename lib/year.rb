class Year

  YEAR_HEADER_WIDTH = 63
  MONTH_OUTPUT_WIDTH = 20
  MONTHS_IN_ROW = 3
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
    year_padding = (" " * ((YEAR_HEADER_WIDTH - year_header.size)/2))
    year_padding + year_header
  end

  def monthline index
    s = String.new
    (1..MONTHS_IN_ROW).each do |i|
      spelled_month = @@months[index].to_s
      padding = (" " * ((MONTH_OUTPUT_WIDTH - spelled_month.size)/2))
      s << padding + spelled_month
      unless i == MONTHS_IN_ROW
        if spelled_month.size.odd?
          padding = padding + " "
        end
        s << padding + GUTTER
      end
      index += 1
    end
    s
  end

  def dayline
    (("Su Mo Tu We Th Fr Sa" + GUTTER) * MONTHS_IN_ROW).rstrip
  end

  def format_line left, middle, right
    left.line_0 + GUTTER + middle.line_0 + GUTTER + right.line_0 + "\n" +
    left.line_1 + GUTTER + middle.line_1 + GUTTER + right.line_1 + "\n" +
    left.line_2 + GUTTER + middle.line_2 + GUTTER + right.line_2 + "\n" +
    left.line_3 + GUTTER + middle.line_3 + GUTTER + right.line_3 + "\n" +
    left.line_4 + GUTTER + middle.line_4 + GUTTER + right.line_4.rstrip + "\n" +
    left.line_5 + GUTTER + middle.line_5 + GUTTER + right.line_5.rstrip
  end

  def block_0
    format_line Month.new(1, @year), Month.new(2, @year), Month.new(3, @year)
  end

  def block_1
    format_line Month.new(4, @year), Month.new(5, @year), Month.new(6, @year)
  end

  def block_2
    format_line Month.new(7, @year), Month.new(8, @year), Month.new(9, @year)
  end

  def block_3
    format_line Month.new(10, @year), Month.new(11, @year), Month.new(12, @year)
  end

end
