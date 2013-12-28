require 'year'
require 'minitest/autorun'

class TestYear < MiniTest::Unit::TestCase

  def test_february_length_returns_correct_number_of_February_days_for_1900
    assert_equal 28, (Year.new.february_length 1900)
  end

  def test_february_length_returns_correct_number_of_February_days_for_1901
    assert_equal 28, (Year.new.february_length 1901)
  end

  def test_february_length_returns_correct_number_of_February_days_for_1904
    assert_equal 29, (Year.new.february_length 1904)
  end

  def test_february_length_returns_correct_number_of_February_days_for_2000
    assert_equal 29, (Year.new.february_length 2000)
  end

  def test_february_length_returns_correct_number_of_February_days_for_2001
    assert_equal 28, (Year.new.february_length 2001)
  end

  def test_february_length_returns_correct_number_of_February_days_for_2012
    assert_equal 29, (Year.new.february_length 2012)
  end

  def test_february_length_returns_correct_number_of_February_days_for_2100
    assert_equal 28, (Year.new.february_length 2100)
  end

  def test_february_length_returns_correct_number_of_February_days_for_2104
    assert_equal 29, (Year.new.february_length 2104)
  end

  def test_february_length_returns_correct_number_of_February_days_for_3000
    assert_equal 28, (Year.new.february_length 3000)
  end

end
