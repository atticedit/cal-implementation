require 'zeller'
require 'minitest/autorun'

class TestZeller < MiniTest::Unit::TestCase

  def test_zeller_returns_correct_day_of_the_week
    assert_equal 5, (Zeller.calculate 20120301)
  end

  def test_zeller_throws_error_for_blank_input
    assert_raises ArgumentError do
      Zeller.calculate ""
    end
  end

end
