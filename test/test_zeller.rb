require_relative 'zeller'
require 'minitest/autorun'

class TestZeller < MiniTest::Unit::TestCase

  def test_zeller_has_a_calculate_method
    Zeller.calculate("April 16, 1896")
  end

  def test_zeller_returns_correct_day_of_the_week
    z = Zeller.calculate("March 1, 2012")
    assert_equal z, 5
  end

end
