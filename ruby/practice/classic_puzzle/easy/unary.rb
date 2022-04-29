# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

message = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

binary = message.chars.map { |char| char.ord.to_s(2).rjust(7, '0') }.join
binary_groups = binary.chars.chunk(&:to_i).map(&:last)

result = binary_groups.flat_map { |group| [2 - group.first.to_i, group.size] }.map { |count| '0' * count }.join(' ')

# puts "answer"
puts result
