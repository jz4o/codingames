# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
map = []
@n.times do
  map << gets.split.map(&:to_i)
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

check_all_sum = map.flatten.sum == (1..(@n**2)).sum

line_sums = []
line_sums += map.map(&:sum)
line_sums += map.transpose.map(&:sum)
line_sums << map.map.with_index { |line, index| line[index] }.sum
line_sums << map.map.with_index(1) { |line, index| line[-index] }.sum

puts(check_all_sum && line_sums.uniq.one? ? 'MAGIC' : 'MUGGLE')
