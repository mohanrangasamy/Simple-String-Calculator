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
end
