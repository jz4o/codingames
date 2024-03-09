# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
ps = []
n.times do
  p = gets.to_i
  ps << p
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_array = []
ps.each do |p|
  index = temp_array.index { |a| p <= a }
  if index
    temp_array[index] = p
  else
    temp_array << p
  end
end

result = temp_array.size

# puts "answer"
puts result
