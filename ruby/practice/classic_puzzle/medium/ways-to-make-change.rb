# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
s = gets.to_i
inputs = gets.split
vis = []
s.times do |i|
  vi = inputs[i].to_i
  vis << vi
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

counter = { 0 => 1 }
vis.sort.reverse_each do |vi|
  next_counter = {}
  next_counter.default = 0

  counter.each do |value, count|
    ((n - value) / vi).downto(0).each do |vi_count|
      next_counter[value + (vi * vi_count)] += count
    end
  end

  counter = next_counter
end

result = counter[n]

# puts "answer"
puts result
