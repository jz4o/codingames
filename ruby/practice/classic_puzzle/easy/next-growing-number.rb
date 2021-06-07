# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

digits = n.to_i.next.digits.reverse

increment_number = nil
digits.each_with_index do |d, i|
  if increment_number
    digits[i] = increment_number
  elsif d > digits[i.next]
    increment_number = d
  end
end

# puts "answer"
puts digits.join
