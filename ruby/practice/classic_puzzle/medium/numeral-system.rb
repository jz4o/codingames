# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@equality = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

NUMERALS = [*'0'..'9', *'A'..'Z'].freeze

x, y, z = @equality.split(/[\+=]/)

equality_chars = @equality.chars
max_numeral = NUMERALS.select { |n| equality_chars.include? n }.last
minimum_n   = NUMERALS.index(max_numeral).next

(minimum_n..NUMERALS.size).each do |i|
  p i and break if x.to_i(i) + y.to_i(i) == z.to_i(i)
end
