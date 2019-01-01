# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@w, @h = gets.split(' ').collect(&:to_i)
map = []
@h.times do
  line = gets.chomp.squeeze.chars
  map << [' ', *line]
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

top = map.shift
bottom = map.pop

map.reverse_each do |line|
  line.each_with_index do |char, index|
    bottom[index.pred..index.next] = bottom[index.pred..index.next].reverse if char == '-'
  end
end

top.delete(' ')
bottom.delete(' ')

puts top.zip(bottom).map(&:join)
