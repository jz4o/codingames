# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

line = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

stack = 0
prefix_size = 0
line.chars.each.with_index(1) do |char, step|
  stack += char == '<' ? 1 : -1

  prefix_size = step if stack.zero?
  break if stack.negative?
end

result = prefix_size

# puts "answer"
puts result
