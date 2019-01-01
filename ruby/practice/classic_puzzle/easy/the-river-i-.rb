# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r1 = gets.to_i
@r2 = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
rivers = [@r1, @r2]
rivers = [rivers.min + rivers.min.digits.sum, rivers.max] until rivers.min.eql? rivers.max

puts rivers.first
