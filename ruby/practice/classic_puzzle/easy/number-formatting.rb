# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

numbertext = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

is_carry_up = 0
is_significant_digit = false
digits = numbertext.chars.map do |d|
  next d if !d.match?(/\d|x/) || (d == 'x' && is_carry_up.zero?)

  div, mod = (is_carry_up + d.to_i).divmod 2

  is_carry_up = mod * 10
  is_significant_digit ||= div > 0

  is_significant_digit ? div : 'x'
end

result = digits.join

# puts "answer"
puts result
