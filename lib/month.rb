class Month

  def find_offset_of_day_one date_array
    year = date_array[0]
    month = date_array[1]

    raise ArgumentError, 'Year must be within the range of 1800–3000' if year < 1800 || year > 3000

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
