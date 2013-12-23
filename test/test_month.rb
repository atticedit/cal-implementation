require 'month'
require 'minitest/autorun'

class TestMonth < MiniTest::Unit::TestCase

  def test_zeller_returns_correct_day_of_week_for_leap_year_January_1st
    assert_equal 1, (Month.new.zeller 20120101)
  end

  def test_zeller_returns_correct_day_of_week_for_leap_year_February_1st
    assert_equal 4, (Month.new.zeller 20120201)
  end

  def test_zeller_returns_correct_day_of_week_for_leap_year_March_1st
    assert_equal 5, (Month.new.zeller 20120301)
  end

  def test_zeller_returns_correct_day_of_week_for_common_year_March_1st
    assert_equal 5, (Month.new.zeller 20130301)
  end

  def test_zeller_returns_correct_day_of_week_for_hundred_divisible_common_year_March_1st
    assert_equal 5, (Month.new.zeller 19000301)
  end

  def test_zeller_throws_error_for_blank_input
    assert_raises ArgumentError do
      Month.new.zeller
    end
  end

  def test_zeller_throws_error_for_incorrect_format
    assert_raises ArgumentError do
      Month.new.zeller 2000
    end
  end

  def test_zeller_throws_error_for_year_outside_scope
    assert_raises ArgumentError do
      Month.new.zeller 15000301
    end
  end

end
