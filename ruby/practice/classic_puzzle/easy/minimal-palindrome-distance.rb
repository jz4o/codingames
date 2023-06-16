# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
s = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

result = (0..n).find do |i|
  front = s[...((n + i) / 2)]
  back = s[-(n - ((n + i) / 2.0).ceil)..]

  front.end_with? back.reverse
end

# puts "answer"
puts result
