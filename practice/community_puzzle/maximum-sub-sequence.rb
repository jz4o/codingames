# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
# inputs = gets.split(" ")
# for i in 0..(@n-1)
#   l = inputs[i].to_i
# end
inputs = gets.split(" ").map(&:to_i)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "1 2 3 4 5"

lists = []
inputs.each do |i|
  lists.each do |list|
    list.push i if list.last.next == i
  end
  lists.push [i]
end

max_size = lists.map { |list| list.size }.max
result = lists.select { |list| list.size == max_size }.last.join(' ')

puts result

