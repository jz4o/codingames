# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

line1 = gets.chomp
line2 = gets.chomp
line3 = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

DIGIT_NUMS = [
  ' ||_ _ ||',
  '       ||',
  '  |___ | ',
  '   ___ ||',
  ' |  _  ||',
  ' | ___  |',
  ' ||___  |',
  '   _   ||',
  ' ||___ ||',
  ' | ___ ||'
].freeze

lines = [line1.chars, line2.chars, line3.chars]
transposed_lines = lines.transpose

result = []
transposed_lines.each_slice(3) do |line|
  result << DIGIT_NUMS.index(line.flatten.join)
end

# puts "number"
puts result.join
