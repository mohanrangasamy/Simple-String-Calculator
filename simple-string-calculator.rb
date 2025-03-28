class SimpleStringCalculator
  def self.add(number_string)
    return "Invalid value" unless number_string.is_a?(String)
    return 0 if number_string.empty?

    parsed_number = number_string.to_i
    parsed_number
  end
end

