# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r = gets.to_i
@l = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

result = [@r]
(@l-1).times do |n|
  temp, result = result, []
  until temp.empty? do
    first_element, another_element = temp.uniq.shift(2)
    delete_size = another_element ? temp.index(another_element) : temp.size
    result += [delete_size, first_element]
    temp.shift delete_size
  end
end

puts result.join(' ')

