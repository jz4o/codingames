# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height, _width = gets.split.collect(&:to_i)
lines1 = []
height.times do
  line = gets.chomp
  lines1 << line
end
lines2 = []
height.times do
  line = gets.chomp
  lines2 << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

lines1_numbers = lines1.join(' ').split.map(&:to_i)
lines2_marks = lines2.join(' ').split
x_numbers = lines1_numbers.zip(lines2_marks).filter_map { |number, mark| number if mark == 'X' }

result = x_numbers.chunk(&:positive?).map { |chunk| chunk.last.size }.all?(1)

# puts "true/false"
puts result
