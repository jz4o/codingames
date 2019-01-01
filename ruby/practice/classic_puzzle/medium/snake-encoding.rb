# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@x = gets.to_i
char_map = []
@n.times do
  line = gets.chomp
  char_map << line.chars
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

# array to strign
char_map = char_map.transpose
char_map.map!.with_index { |line, index| index.even? ? line.reverse : line }
chars = char_map.join

# rotate char(s)
chars = (chars * 2)[(@n**2) - @x, chars.length]

# string to array
char_map = chars.scan(/.{#{@n}}/)
char_map.map!.with_index { |line, index| index.even? ? line.reverse.chars : line.chars }
char_map = char_map.transpose

# print answer
char_map.each do |line|
  puts line.join
end
