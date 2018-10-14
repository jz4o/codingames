# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n1, @n2 = gets.split(" ").collect {|x| x.to_i}
@s1 = gets.chomp
@s2 = gets.chomp
@t = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

s1_move_part = @s1[0...@t].chars.reverse
s2_move_part = @s2[0...@t].chars

(@t - s1_move_part.size).times { s1_move_part.unshift nil }
(@t - s2_move_part.size).times { s2_move_part.push    nil }

s1_not_move_part = @s1[@t..-1].to_s.chars.reverse
s2_not_move_part = @s2[@t..-1].to_s.chars

s_moved_part = s2_move_part.zip s1_move_part

puts [s1_not_move_part, s_moved_part, s2_not_move_part].join

