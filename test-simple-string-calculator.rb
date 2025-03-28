require "minitest/autorun"
require_relative "simple-string-calculator"

class TestAddMethod < Minitest::Test
  def test_valid_integer_string
    assert_equal 123, SimpleStringCalculator.add("123")
  end

  def test_empty_string
    assert_equal 0, SimpleStringCalculator.add("")
  end

  def test_invalid_input_non_string
    assert_equal "Invalid value", SimpleStringCalculator.add(nil)
    assert_equal "Invalid value", SimpleStringCalculator.add(123)
    assert_equal "Invalid value", SimpleStringCalculator.add([])
    assert_equal "Invalid value", SimpleStringCalculator.add({})
  end

  def test_non_numeric_string
    assert_equal 0, SimpleStringCalculator.add("abc")  # `to_i` converts non-numeric strings to 0
    assert_equal 5, SimpleStringCalculator.add("5abc") # `to_i` stops at first non-numeric character
  end

  def test_add_with_valid_numbers
    assert_equal 6, SimpleStringCalculator.add("1,2,3")
    assert_equal 15, SimpleStringCalculator.add("5,5,5")
  end

  def test_add_with_non_numeric_strings
    assert_equal [0, 0].sum, SimpleStringCalculator.add("abc,xyz")  # Both words convert to 0
    assert_equal [5, 0].sum, SimpleStringCalculator.add("5,xyz")    # 'xyz' converts to 0
  end

  def test_add_with_mixed_spaces
    assert_equal 10, SimpleStringCalculator.add("3, 7")  # Note: Spaces won't affect `.split(',')`
  end

  def test_add_with_negative_numbers
    assert_equal "Negative numbers allowed -1, -3", SimpleStringCalculator.add("1,-1,3,-3")
    assert_equal "Negative numbers allowed -5", SimpleStringCalculator.add("-5,5")
  end
end