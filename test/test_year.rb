require 'year'
require 'minitest/autorun'

class TestYear < MiniTest::Unit::TestCase

  def test_february_length_returns_correct_number_of_February_days_for_1900
    assert_equal 28, Year.new(1900).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_1901
    assert_equal 28, Year.new(1901).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_1904
    assert_equal 29, Year.new(1904).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_2000
    assert_equal 29, Year.new(2000).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_2001
    assert_equal 28, Year.new(2001).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_2012
    assert_equal 29, Year.new(2012).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_2100
    assert_equal 28, Year.new(2100).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_2104
    assert_equal 29, Year.new(2104).february_length
  end

  def test_february_length_returns_correct_number_of_February_days_for_3000
    assert_equal 28, Year.new(3000).february_length
  end

end
