# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

input = gets.chomp
# 4.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "answer"
# end

digits = input.delete(':')[1..].chars.map(&:to_i)
four_bit_digits = digits.map { |d| d.to_s(2).rjust(4, '0') }
transposed_four_bit_digits = four_bit_digits.map(&:chars).transpose

results = transposed_four_bit_digits.map do |bits|
  replaced_bits = bits.map { |b| (b == '0' ? '_' : '#') * 5 }

  "|#{replaced_bits.join('|')}|"
end

results.each do |result|
  puts result
end
