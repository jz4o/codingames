# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

digits = n.chars.map(&:to_i)
max_digit = digits.max
chunk_size = 1
base = 1

loop do
  base += 1

  temp_chunk_size = digits.chunk { |digit| digit % base }.to_a.size
  break if temp_chunk_size < chunk_size || max_digit < base

  chunk_size = temp_chunk_size
end

result = max_digit < base ? 'Normal' : base

# puts "Normal"
puts result
