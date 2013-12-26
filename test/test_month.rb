require 'month'
require 'minitest/autorun'

class TestMonth < MiniTest::Unit::TestCase

  def test_first_day_zeller_returns_correct_day_of_week_for_leap_year_January_1st
    assert_equal 1, (Month.new.first_day_zeller [2012,01])
  end

  def test_first_day_zeller_returns_correct_day_of_week_for_leap_year_February_1st
    assert_equal 4, (Month.new.first_day_zeller [2012,02])
  end

  def test_first_day_zeller_returns_correct_day_of_week_for_leap_year_March_1st
    assert_equal 5, (Month.new.first_day_zeller [2012,03])
  end

  def test_first_day_zeller_returns_correct_day_of_week_for_common_year_March_1st
    assert_equal 3, (Month.new.first_day_zeller [2011,03])
  end

  def test_first_day_zeller_returns_correct_day_of_week_for_hundred_divisible_common_year_March_1st
    assert_equal 5, (Month.new.first_day_zeller [1900,03])
  end

  def test_first_day_zeller_throws_error_for_blank_input
    assert_raises ArgumentError do
      Month.new.first_day_zeller
    end
  end

  def test_first_day_zeller_throws_error_for_incorrect_format
    assert_raises NoMethodError do
      Month.new.first_day_zeller [2000]
    end
  end

  def test_first_day_zeller_throws_error_for_year_below_scope
    assert_raises ArgumentError do
      Month.new.first_day_zeller [1500,03]
    end
  end

  def test_first_day_zeller_throws_error_for_year_above_scope
    assert_raises ArgumentError do
      Month.new.first_day_zeller [4000,01]
    end
  end

end
