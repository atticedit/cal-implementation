class Month

  def initialize
  end

  def firstdayzeller date_array
    year = date_array[0]
    month = date_array[1]
    raise ArgumentError, 'Year must be within the range of 1800–3000' if year < 1800 || year > 3000
    if month == 1
      month = 13
      year = year - 1
    elsif month == 2
      month = 14
      year = year - 1
    end
    dayofweek = (1 + (26 * (month + 1)/10) + year + (year/4) + (6 * (year/100)) + (year/400)).modulo(7)
  end

end
