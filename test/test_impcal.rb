require_relative 'impcal'
require 'minitest/autorun'

class Testimpcal < MiniTest::Unit::TestCase

  def test_impcal_accepts_arguments
    impcal "04 1896" #resolve taking argument without quotes
  end

  def test_impcal_matches_cal_for_leap_year_January_with_Sunday_start
    imp = impcal "01 2012"
    c = cal "01 2012"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_for_leap_year_February
    imp = impcal "02 2012"
    c = cal "02 2012"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_for_6_line_month
    imp = impcal "09 2012"
    c = cal "09 2012"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_for_4_line_month
    imp = impcal "02 2015"
    c = cal "02 2015"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_for_hundred_divisible_common_year_February
    imp = impcal "02 1900"
    c = cal "02 1900"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_when_year_argument_given
    imp = impcal "2013"
    c = cal "2013"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_when_year_and_one_digit_month_given
    imp = impcal "4 1896"
    c = cal "4 1896"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_when_year_and_spelled_month_given
    imp = impcal "December 2013"
    c = cal "December 2013"
    assert_equal imp, c
  end

  def test_impcal_matches_cal_when_year_and_abbreviated_month_given
    imp = impcal "Dec 2013"
    c = cal "Dec 2013"
    assert_equal imp, c
  end

  def test_impcal_with_no_arguments_displays_current_month
    imp = impcal
    c = cal
    assert_equal imp, c
  end

  def test_impcal_throws_error_for_incorrect_format
    assert_raises ArgumentError do
      impcal "2013 12"
    end
  end

  def test_impcal_doesnt_match_cal_for_Julian_calendar_year_February
    imp = impcal "02 1500"
    c = cal "02 1500"
    assert_not_equal imp, c
  end

end
