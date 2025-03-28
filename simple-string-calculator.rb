class SimpleStringCalculator
  def self.add(number_string)
    return "Invalid value" unless number_string.is_a?(String)
    return 0 if number_string.empty?

    # Check if a custom delimiter is provided at the beginning
    if number_string.start_with?("//")
      # Extract delimiter and numbers
      delimiter_end = number_string.index("\n")
      delimiter = number_string[2..delimiter_end-1]
      numbers = number_string[delimiter_end+1..-1]

      # Split the numbers using the custom delimiter
      parsed_numbers = numbers.split(delimiter).map(&:to_i)
    else
      # If no custom delimiter, split using commas and newlines
      parsed_numbers = number_string.split(/,|\n/).map(&:to_i)
    end

    # Find negative numbers
    negative_numbers = parsed_numbers.select { |num| num < 0 }

    if negative_numbers.any?
      # Update the error message as per your test's expected output
      return "Negative numbers allowed #{negative_numbers.join(', ')}"
    end

    # Return the sum
    parsed_numbers.sum
  end
end