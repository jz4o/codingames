# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@equality = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

NUMERALS = [*'0'..'9', *'A'..'Z'].freeze

x, y, z = @equality.split(/[+=]/)

equality_chars = @equality.chars
max_numeral = NUMERALS.reverse.find { |n| equality_chars.include? n }
minimum_n   = NUMERALS.index(max_numeral).next

n = (minimum_n..NUMERALS.size).find { |i| x.to_i(i) + y.to_i(i) == z.to_i(i) }

puts n
