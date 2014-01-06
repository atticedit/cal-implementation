class Year

  # refactor to remove this magic number
  MONTH_OUTPUT_WIDTH = 20
  YEAR_OUTPUT_PADDING = 29

  GUTTER = "  "

  @@months = ["January","February","March","April","May","June","July","August","September","October","November","December"]

  def initialize year
    if year < 1800 || year > 3000
      puts "Year must be within the range of 1800–3000"
      exit
    end
    @year = year

    # @months = [Array.new]
    # @months << Month.new(1, @year)
    # @months << Month.new(2, @year)
    # @months << Month.new(3, @year)
    # @months << Month.new(4, @year)
    # @months << Month.new(5, @year)
    # @months << Month.new(6, @year)
    # @months << Month.new(7, @year)
    # @months << Month.new(8, @year)
    # @months << Month.new(9, @year)
    # @months << Month.new(10, @year)
    # @months << Month.new(11, @year)
    # @months << Month.new(12, @year)
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

  def label
    year_label = "#{@year}"
    year_padding = (" " * YEAR_OUTPUT_PADDING)
    year_padding + year_label
  end

  def header
    index = 0
    3.times do |l|
      month = @@months[index]
      length_of_month_name = month.to_s.size
      padding = (" " * ((MONTH_OUTPUT_WIDTH - length_of_month_name)/2))
      padding + month
      unless l == 2
        if length_of_month_name % 2 != 0
          " "
        end
        padding + GUTTER
      end
      index += 1
    end
    puts
  end

  def dayline
    (("Su Mo Tu We Th Fr Sa" + GUTTER) * 3).rstrip
  end

  # def format_line left, middle, right
  #   @months[left].line_0 + "  " + @months[middle].line_0 + "  " + @months[right].line_0
  #   @months[left].line_1 + "  " + @months[middle].line_1 + "  " + @months[right].line_1
  #   @months[left].line_2 + "  " + @months[middle].line_2 + "  " + @months[right].line_2
  #   @months[left].line_3 + "  " + @months[middle].line_3 + "  " + @months[right].line_3
  #   @months[left].line_4 + "  " + @months[middle].line_4 + "  " + @months[right].line_4
  #   @months[left].line_5 + "  " + @months[middle].line_5 + "  " + @months[right].line_5
  #   @months[left].line_6 + "  " + @months[middle].line_6 + "  " + @months[right].line_6
  # end

  # def block_0
  #   format_line 1,2,3
  # end

  # def block_1
  #   format_line 4,5,6
  # end

  # def block_2
  #   format_line 7,8,9
  # end

  # def block_3
  #   format_line 10,11,12
  # end

end
