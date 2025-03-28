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
    assert_equal 0, SimpleStringCalculator.add("abc")
    assert_equal 5, SimpleStringCalculator.add("5abc")
  end

  def test_add_with_valid_numbers
    assert_equal 6, SimpleStringCalculator.add("1,2,3")
    assert_equal 15, SimpleStringCalculator.add("5,5,5")
  end

  def test_add_with_non_numeric_strings
    assert_equal [0, 0].sum, SimpleStringCalculator.add("abc,xyz")
    assert_equal [5, 0].sum, SimpleStringCalculator.add("5,xyz")
  end

  def test_add_with_mixed_spaces
    assert_equal 10, SimpleStringCalculator.add("3, 7")
  end

  def test_add_with_negative_numbers
    assert_equal "Negative numbers allowed -1, -3", SimpleStringCalculator.add("1,-1,3,-3")
    assert_equal "Negative numbers allowed -5", SimpleStringCalculator.add("-5,5")
  end

  def test_add_with_new_line_only
    assert_equal 6, SimpleStringCalculator.add("1\n2\n3")
  end

  def test_add_with_mixed_delimiters
    assert_equal 10, SimpleStringCalculator.add("1,2\n3,4")
  end
end