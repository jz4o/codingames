uto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@c = gets.to_i
budgets = []
@n.times do
  budgets << gets.to_i
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "IMPOSSIBLE"

if budgets.sum < @c
  puts 'IMPOSSIBLE'
else
  lack = @c
  budgets.sort!
  until budgets.empty?
    average = lack / budgets.size
    pay = [budgets.shift, average].min
    lack -= pay
    puts pay
  end
end

