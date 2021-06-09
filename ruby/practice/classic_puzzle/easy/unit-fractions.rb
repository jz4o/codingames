# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

nr = Rational(1, n)

results = []
(n.next..(n * 2)).each do |y|
  yr = Rational(1, y)
  xr = nr - yr
  next unless xr.numerator == 1 && xr <= yr

  results << "#{nr} = #{xr} + #{yr}"
end

# puts "1/n = 1/x + 1/y"
puts results
