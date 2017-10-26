# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r_1 = gets.to_i
@r_2 = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
rivers = [@r_1, @r_2]
until rivers.min.eql? rivers.max do
  total_each_digit = 0
  rivers.min.to_s.chars.map { |i| total_each_digit += i.to_i }

  rivers = [rivers.min + total_each_digit, rivers.max]
end

puts rivers.first
