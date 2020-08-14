# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

MODULUS_WEIGHTS = {
  10 => [1, 3] * 6,
  11 => 10.downto(1).to_a
}.freeze

@n = gets.to_i
invalids = []
@n.times do
  isbn = gets.chomp
  invalids << isbn and next unless isbn.match?(/^\d+X?$/)

  modulus = nil
  case isbn.size
  when 10
    modulus = 11
  when 13
    invalids << isbn and next if isbn[-1] == 'X'

    modulus = 10
  else
    invalids << isbn and next
  end

  sum = isbn[0..-2].chars.map.with_index do |digit, index|
    digit.to_i * MODULUS_WEIGHTS[modulus][index]
  end.sum
  check_sum = (modulus - (sum % modulus)) % modulus
  invalids << isbn unless check_sum == [*'0'..'9', 'X'].index(isbn[-1])
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

puts "#{invalids.size} invalid:", invalids
