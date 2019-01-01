# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@dec = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "42"

BASE_NUM = 3

reverse_result = []
@dec.abs.digits(BASE_NUM).each_with_index do |n, index|
  reverse_result[index] ||= 0
  target = reverse_result[index] += n
  next unless BASE_NUM.pred <= target

  reverse_result[index] -= BASE_NUM

  next_index = index.next
  reverse_result[next_index] = reverse_result[next_index]&.next || 1
end

reverse_result.map!(&:-@) if @dec.negative?
puts reverse_result.reverse.map { |n| n.negative? ? 'T' : n }.join
