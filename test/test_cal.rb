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

  def test_cal_dot_rb_matches_cal_when_year_and_one_digit_month_given
    assert_equal `cal 4 1896`, `ruby cal.rb 4 1896`
  end

  def test_cal_dot_rb_matches_cal_when_year_argument_given
    assert_equal `cal 2013`, `ruby cal.rb 2013`
  end

  def test_cal_dot_rb_matches_cal_when_incorrect_format_given
    assert_equal `cal 2013 12`, `ruby cal.rb 2013 12`
  end

  def test_cal_dot_rb_rejects_year_outside_scope
    assert_equal "", `ruby cal.rb 1 1500`
  end

end
