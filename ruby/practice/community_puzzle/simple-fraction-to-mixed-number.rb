# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@n.times do
  x, y = gets.chomp.split('/').map(&:to_i)
  if y.zero?
    puts 'DIVISION BY ZERO'
    next
  end

  rational = Rational(x, y)
  int = rational.to_i
  rat = rational-int
  rat = -rat if int.negative?
  int = '' if int.zero?
  rat = '' if rat.numerator.zero?

  result = "#{int} #{rat}".strip
  puts result.empty? ? '0' : result
end

# @n.times do
#
#   # Write an action using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "answer"
# end

