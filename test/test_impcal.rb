require_relative 'impcal'
require 'minitest/autorun'

class TestImpcal < MiniTest::Unit::TestCase

  def test_impcal_accepts_arguments
    Impcal "04 1896"
  end

end
