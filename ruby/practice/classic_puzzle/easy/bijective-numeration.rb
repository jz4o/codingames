# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

count = gets.to_i
inputs = gets.split
decimaries = []
(0...count).each do |i|
  decimary = inputs[i]
  decimaries << decimary
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def to_decimal(decimary)
  ace_indexes = decimary.chars.reverse.filter_map.with_index do |char, index|
    index if char == 'A'
  end

  other_ace_decimal = decimary.tr('A', '0').to_i
  ace_decimal = ace_indexes.sum { |index| 10**(index + 1) }

  other_ace_decimal + ace_decimal
end

def to_decimary(decimal)
  return decimal if decimal.zero? || !decimal.digits.any?(&:zero?)

  digits = decimal.digits.reverse
  while (zero_indexes = digits[1..].filter_map.with_index(1) { |digit, index| index if digit.zero? }).any?
    zero_indexes.each do |index|
      digits[index - 1] -= 1
      digits[index] = 10
    end
  end

  digits.map { |digit| digit == 10 ? 'A' : digit }.join.sub(/^0+/, '')
end

sum_decimal = decimaries.sum { |decimary| to_decimal decimary }

result = to_decimary sum_decimal

# puts "summation"
puts result
