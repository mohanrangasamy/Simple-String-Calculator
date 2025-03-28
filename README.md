# Simple String Calculator

## Description
This project is a simple string calculator implemented in Ruby. It provides basic string-based arithmetic operations, allowing addition of numbers from a string input, including support for custom delimiters.

## Features
- Handles empty string input, returning `0`.
- Supports comma (`,`) and newline (`\n`) as default delimiters.
- Allows custom delimiters defined at the beginning of the string (e.g., `//;
1;2;3` uses `;` as the delimiter).
- Returns an error message if negative numbers are encountered, listing them.

## Files
- **`simple-string-calculator.rb`**: The main calculator script containing the `SimpleStringCalculator` class with the `add` method.
- **`test-simple-string-calculator.rb`**: The test file containing unit tests for the calculator.

## Prerequisites
Ensure you have Ruby installed on your system. You can check by running:
```sh
ruby -v
```
If Ruby is not installed, you can download and install it from [ruby-lang.org](https://www.ruby-lang.org/).

## Running the Tests
To execute the test cases, run the following command in your terminal:
```sh
ruby test-simple-string-calculator.rb
```

## Usage
To use the calculator, call the `SimpleStringCalculator.add` method with a string input:
```ruby
require_relative 'simple-string-calculator'

puts SimpleStringCalculator.add("1,2,3")   # Output: 6
puts SimpleStringCalculator.add("1\n2,3")  # Output: 6
puts SimpleStringCalculator.add("//;\n1;2;3")  # Output: 6
puts SimpleStringCalculator.add("-1,2,-3")  # Output: "Negative numbers allowed -1, -3"
```
