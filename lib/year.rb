class Year

  YEAR_HEADER_WIDTH = 62
  MONTH_OUTPUT_WIDTH = 20
  NUMBER_OF_MONTHS_ACROSS = 3
  GUTTER = "  "
  MONTHS = ["January", "February", "March",
            "April", "May", "June",
            "July", "August", "September",
            "October", "November", "December"]

  def initialize year
    if year < 1800 || year > 3000
      raise ArgumentError,
      "Year must be within the range of 1800–3000"
    end
    @year = year
  end

  def february_length
    # February has 28 days if the year is not divisible by 4
    if @year % 4 != 0
      28
    # February has 28 days if the year is divisible by 100
    # but not by 400
    elsif (@year % 100 == 0) && (@year % 400 != 0)
      28
    # February has 29 days if neither of the above is true
    else
      29
    end
  end

  def header
    "#{@year}".center(YEAR_HEADER_WIDTH).rstrip
  end

  def monthline index
    monthline = String.new
    (1..NUMBER_OF_MONTHS_ACROSS).each do |i|
      month_name = MONTHS[index].to_s
      monthline << month_name.center(MONTH_OUTPUT_WIDTH)
      unless i == NUMBER_OF_MONTHS_ACROSS
        monthline << GUTTER
      end
      index += 1
    end
    monthline.rstrip
  end

  def dayline
    (("Su Mo Tu We Th Fr Sa" + GUTTER) *
      NUMBER_OF_MONTHS_ACROSS).rstrip
  end

  def format_row left, middle, right
    left.row_0 + GUTTER + middle.row_0       +
                 GUTTER + right.row_0        + "\n" +
    left.row_1 + GUTTER + middle.row_1       +
                 GUTTER + right.row_1        + "\n" +
    left.row_2 + GUTTER + middle.row_2       +
                 GUTTER + right.row_2        + "\n" +
    left.row_3 + GUTTER + middle.row_3       +
                 GUTTER + right.row_3        + "\n" +
    left.row_4 + GUTTER + middle.row_4       +
                 GUTTER + right.row_4.rstrip + "\n" +
    left.row_5 + GUTTER + middle.row_5       +
                 GUTTER + right.row_5.rstrip
  end

  def block_0
    format_row Month.new(1, @year),
               Month.new(2, @year),
               Month.new(3, @year)
  end

  def block_1
    format_row Month.new(4, @year),
               Month.new(5, @year),
               Month.new(6, @year)
  end

  def block_2
    format_row Month.new(7, @year),
               Month.new(8, @year),
               Month.new(9, @year)
  end

  def block_3
    format_row Month.new(10, @year),
               Month.new(11, @year),
               Month.new(12, @year)
  end

end
