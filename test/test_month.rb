require 'month'
require 'minitest/autorun'

class TestMonth < MiniTest::Unit::TestCase

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_January_1st
    assert_equal 0, (Month.new.find_offset_of_day_one 2012, 01)
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_February_1st
    assert_equal 3, (Month.new.find_offset_of_day_one 2012, 02)
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_leap_year_March_1st
    assert_equal 4, (Month.new.find_offset_of_day_one 2012, 03)
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_common_year_March_1st
    assert_equal 2, (Month.new.find_offset_of_day_one 2011, 03)
  end

  def test_find_offset_of_day_one_returns_correct_day_of_week_for_hundred_divisible_common_year_March_1st
    assert_equal 4, (Month.new.find_offset_of_day_one 1900, 03)
  end

  def test_find_offset_of_day_one_throws_error_for_blank_input
    assert_raises ArgumentError do
      Month.new.find_offset_of_day_one
    end
  end

  def test_find_offset_of_day_one_throws_error_for_incorrect_format
    assert_raises ArgumentError do
      Month.new.find_offset_of_day_one 2000
    end
  end

  def test_find_offset_of_day_one_throws_error_for_year_below_scope
    assert_raises ArgumentError do
      Month.new.find_offset_of_day_one 1500, 03
    end
  end

  def test_find_offset_of_day_one_throws_error_for_year_above_scope
    assert_raises ArgumentError do
      Month.new.find_offset_of_day_one 4000, 01
    end
  end

end
