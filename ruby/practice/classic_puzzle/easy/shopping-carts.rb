# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
carts_array = []
n.times do |i|
  carts = inputs[i].to_i
  carts_array << carts
end
actions = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_carts_array = carts_array.dup
is_impossible = false
actions.chars.each do |action|
  case action
  when 'R'
    min_carts = temp_carts_array.min
    index = temp_carts_array.rindex min_carts
    temp_carts_array[index] += 1
  when 'T'
    max_carts = temp_carts_array.max
    is_impossible = true and break if max_carts.zero?

    index = temp_carts_array.index max_carts
    temp_carts_array[index] -= 1
  end
end

result = is_impossible ? 'IMPOSSIBLE' : temp_carts_array.join(' ')

# puts "number of carts per line or IMPOSSIBLE"
puts result
