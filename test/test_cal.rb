require 'minitest/autorun'

class TestCalIntegration < MiniTest::Unit::TestCase

  def test_cal_dot_rb_matches_cal_for_leap_year_January_with_Sunday_start
    assert_equal `cal 01 2012`, `ruby cal.rb 01 2012`
  end

  def test_cal_dot_rb_matches_cal_for_leap_year_February
    assert_equal `cal 02 2012`, `ruby cal.rb 02 2012`
  end

  def test_cal_dot_rb_matches_cal_for_6_line_month
    assert_equal `cal 09 2012`, `ruby cal.rb 09 2012`
  end

  def test_cal_dot_rb_matches_cal_for_4_line_month
    assert_equal `cal 02 2015`, `ruby cal.rb 02 2015`
  end

  def test_cal_dot_rb_matches_cal_for_hundred_divisible_common_year_February
    assert_equal `cal 02 1900`, `ruby cal.rb 02 1900`
  end

  def test_cal_dot_rb_matches_cal_when_year_argument_given
    assert_equal `cal 2013`, `ruby cal.rb 2013`
  end

  def test_cal_dot_rb_matches_cal_when_year_and_one_digit_month_given
    assert_equal `cal 4 1896`, `ruby cal.rb 4 1896`
  end

  def test_cal_dot_rb_matches_cal_when_year_and_spelled_month_given
   assert_equal `cal December 2013`, `ruby cal.rb December 2013`
  end

  def test_cal_dot_rb_matches_cal_when_year_and_abbreviated_month_spelling_given
    assert_equal `cal Dec 2013`, `ruby cal.rb Dec 2013`
  end

  def test_cal_dot_rb_matches_cal_when_no_arguments_given
    assert_equal `cal`, `ruby cal.rb`
  end

  def test_cal_dot_rb_matches_cal_error_message_for_incorrect_format
    assert_equal `cal 2013 12`, `ruby cal.rb 2013 12`
  end

  def test_cal_dot_rb_throws_error_for_Julian_year
    assert_equal "Date must be in the range of years 1800–3000 (ArgumentError)", `ruby cal.rb 1500`
  end

end
