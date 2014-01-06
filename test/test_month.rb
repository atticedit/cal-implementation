require 'month'
require 'minitest/autorun'

class TestMonth < MiniTest::Unit::TestCase

  def test_month_throws_error_for_incorrect_format
    assert_raises ArgumentError do
      Month.new(2000)
    end
  end

  def test_month_throws_error_for_year_below_scope
    assert_raises ArgumentError do
      Month.new(1, 1500)
    end
  end

  def test_month_throws_error_for_year_above_scope
    assert_raises ArgumentError do
      Month.new(1, 4000)
    end
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_January_1st
    assert_equal 0, Month.new(1, 2012).find_offset_of_day_one
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_February_1st
    assert_equal 3, Month.new(2, 2012).find_offset_of_day_one
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_March_1st
    assert_equal 4, Month.new(3, 2012).find_offset_of_day_one
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_common_year_March_1st
    assert_equal 2, Month.new(3, 2011).find_offset_of_day_one
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_hundred_divisible_common_year_March_1st
    assert_equal 4, Month.new(3, 1900).find_offset_of_day_one
  end

  def test_find_offset_of_day_one_throws_error_for_blank_input
    assert_raises ArgumentError do
      Month.new.find_offset_of_day_one
    end
  end

  def test_find_offset_of_day_one_throws_error_for_incorrect_format
    assert_raises ArgumentError do
      Month.new(2000).find_offset_of_day_one
    end
  end

end
