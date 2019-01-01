# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@input = gets.chomp.split

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
minus = @input.delete '-'
dot   = @input.delete '.'

@input.map!(&:to_i)
if minus
  @input = @input.sort.join
  @input.insert(1, dot) if dot
  @input.insert(0, minus)
  @input = 0 if @input.match?(/\A\-0\.0+\Z/)
else
  @input = @input.sort.reverse.join
  @input.insert(-2, dot) if dot
  @input = @input[0...-2] if @input.end_with? '.0'
end

puts @input
