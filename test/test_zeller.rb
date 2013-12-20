require_relative 'zeller'
require 'minitest/autorun'

class TestZeller < MiniTest::Unit::TestCase

  def test_zeller_has_a_calculate_method
    Zeller.calculate("April 16, 1896")
  end

end
