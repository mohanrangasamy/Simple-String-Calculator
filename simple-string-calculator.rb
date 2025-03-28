class SimpleStringCalculator
  def self.add(number_string)
    return "Invalid value" unless number_string.is_a?(String)
    return 0 if number_string.empty?

    parsed_numbers = number_string.split(',').map(&:to_i)

    # Find negative numbers
    negative_numbers = parsed_numbers.select { |num| num < 0 }

    if negative_numbers.any?
      return "Negative numbers allowed #{negative_numbers.join(', ')}"
    end

    parsed_numbers.sum
  end
end
