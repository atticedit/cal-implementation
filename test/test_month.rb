require 'month'
require 'minitest/autorun'

class TestMonth < MiniTest::Unit::TestCase

  def test_zeller_returns_correct_day_of_the_week
    assert_equal 5, (Month.new.zeller 20120301)
  end

  def test_zeller_throws_error_for_blank_input
    assert_raises ArgumentError do
      Month.new.zeller ""
    end
  end

end
