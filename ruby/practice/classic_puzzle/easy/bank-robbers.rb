# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r = gets.to_i
@v = gets.to_i
robbers = Array.new(@r, 0)
@v.times do
  c, n = gets.split.collect(&:to_i)
  vault_time = (10**n) * (5**(c - n))
  robbers[robbers.index(robbers.min)] += vault_time
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "1"
puts robbers.max
