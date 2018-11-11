# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
pis = []
@n.times do
  pis << gets.to_i
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
diff = 10000000 - 0
pis.sort.each_cons(2) do |n, m|
  d = m - n
  diff = d if diff > d
end

puts diff

