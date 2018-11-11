# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
integers = gets.split.map(&:to_i)

total_cost = 0
while integers.size >= 2 do
  cost       =  integers.sort!.shift(2).sum
  total_cost += cost
  integers   << cost
end

puts total_cost

