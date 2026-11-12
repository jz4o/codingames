# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rational = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_rational = rational.to_r

result_denominators = []
while temp_rational.numerator != 1
  previous_denominator = result_denominators.max || 0
  denominator = [(temp_rational.denominator.to_f / temp_rational.numerator).ceil, previous_denominator + 1].max

  result_denominators << denominator
  temp_rational -= Rational(1, denominator)
end
result_denominators << temp_rational.denominator

result = result_denominators.map { |d| Rational(1, d) }.join ' + '

# puts "egyptian fraction string"
puts result
