# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
as = []
n.times do |i|
  a = inputs[i].to_i
  as << a
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

areas = as.flat_map.with_index do |l, l_index|
  as[(l_index + 1)..].map.with_index(l_index + 1) do |r, r_index|
    height = [l, r].min
    width = r_index - l_index

    height * width
  end
end

result = areas.max

# puts "answer"
puts result
