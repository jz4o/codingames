# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r_1 = gets.to_i
@r_2 = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
rivers = [@r_1, @r_2]
until rivers.min.eql? rivers.max do
  rivers = [rivers.min + rivers.min.digits.sum, rivers.max]
end

puts rivers.first

