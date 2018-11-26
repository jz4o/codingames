# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@x = gets.chomp
@y = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "anwser"

char_map = [@x.chars, @y.chars].transpose
replace_map = char_map.select { |x,y| x != y }.to_h
result = @x.clone.tr replace_map.keys.join, replace_map.values.join

if @x == @y
  puts 'NONE'
elsif result == @y
  puts replace_map.map { |key, value| "#{key}->#{value}"}
else
  puts "CAN'T"
end

