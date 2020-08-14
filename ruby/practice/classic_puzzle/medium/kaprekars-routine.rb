# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n1 = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "1 2 3 4"

DIGITS_SIZE = @n1.size
answers = []

until answers.include? @n1 do
  answers << @n1
  answer = @n1.chars.sort.reverse.join.to_i - @n1.chars.sort.join.to_i
  @n1 = format("%0#{DIGITS_SIZE}d", answer)
end

puts answers[answers.index(@n1)..].join(' ')
