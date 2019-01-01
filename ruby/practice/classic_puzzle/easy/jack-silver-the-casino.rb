# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@rounds = gets.to_i
@cash = gets.to_i
@rounds.times do
  @cash -= bet = (@cash / 4.0).ceil
  ball, call, number = gets.chomp.split
  case call
  when 'PLAIN'
    @cash += bet * 36 if ball == number
  when 'ODD'
    @cash += bet * 2 if ball.to_i.odd?
  when 'EVEN'
    @cash += bet * 2 if ball.to_i.even? && ball.to_i.positive?
  end
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "cash of the target after playing"
puts @cash
