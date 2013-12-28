class Year

  def february_length year
    # February has 28 days if the year is not divisible by 4
    if year % 4 != 0
      days_in_february = 28
    # February has 28 days if the year is divisible by 100 but not by 400
    elsif (year % 100 == 0) && (year % 400 != 0)
      days_in_february = 28
    # February has 29 days if neither of the above is true
    else
      days_in_february = 29
    end
  end

end
