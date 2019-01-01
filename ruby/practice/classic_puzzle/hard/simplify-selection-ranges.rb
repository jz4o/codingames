# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer

def add_item(array, items)
  if items.size >= 3
    array << "#{items.first}-#{items.last}"
  else
    array.replace(array + items)
  end
end

numbers = @n.delete('[]').split(',').map(&:to_i).sort
result = []
temp = []
until numbers.empty? do
  if temp.empty? || (temp.last + 1 == numbers.first)
    temp.push numbers.shift
  else
    add_item result, temp
    temp.clear
  end
end
add_item result, temp unless temp.empty?

puts result.join(',')
