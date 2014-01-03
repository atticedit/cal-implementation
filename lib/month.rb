class Month

  def first_day_zeller date_array
    year = date_array[0]
    month = date_array[1]

    raise ArgumentError, 'Year must be within the range of 1800–3000' if year < 1800 || year > 3000

    case month
    when 1 then month = 13 and year -= 1
    when 2 then month = 14 and year -= 1
    end

    dayofweek = (1 + (26 * (month + 1)/10) + year + (year/4) + (6 * (year/100)) + (year/400)).modulo(7)
    dayofweek += 7 if dayofweek == 0
    dayofweek

  end

end
