# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

f0, n = gets.split.map(&:to_i)
a, b = gets.split.map(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_array = Array.new n, 0
temp_array.unshift f0

(a..n).each do |i|
  begin_index = [i - b, 0].max
  end_index = i - a
  temp_array[i] = temp_array[begin_index..end_index].sum
end

result = temp_array.last

# puts "Rabbits on time N."
puts result
