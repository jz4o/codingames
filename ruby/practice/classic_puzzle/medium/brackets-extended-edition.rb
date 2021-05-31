# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
n.times do
  expression = gets.chomp

  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  expression.delete!('^()[]{}<>')
  expression.tr!('([{<', ')]}>')

  brackets = []
  expression.chars.each do |c|
    c == brackets.last ? brackets.pop : brackets << c
  end

  # puts "true"
  puts brackets.empty?
end
