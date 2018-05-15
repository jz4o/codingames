# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@x = gets.chomp
@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "AA-000-AA"

ad, cde, fg = @x.split('-')

alpha = ad + fg
cde = (cde.to_i + @n).pred

carry, cde = cde.divmod 999
carry.times { alpha.next! }

ad = alpha[0, 2]
cde = format '%03d', cde.next
fg = alpha[-2, 2]

puts [ad, cde, fg].join('-')

