# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
3.times do
  line = gets.chomp # One line out of three in the string describing the arrangement of the numbers.
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

a, b, c, d, e, f = *lines.join.delete(' ').chars.map(&:to_i)
is_not_degenerate = [a + f, b + d, c + e].all?(7) && [a, b, c, d, e, f].sort == (1..6).to_a

result =
  if is_not_degenerate
    is_turn_over = false
    unless a <= 3
      a, f = f, a
      is_turn_over = true
    end
    b, c, d, e = d, e, b, c unless c <= 3

    target_faces = [a, b, c, d, e, f] - [4, 5, 6]
    (target_faces * 2).join.include?('123') == is_turn_over ? 'left-handed' : 'right-handed'
  else
    'degenerate'
  end

# Output one of "right-handed", "left-handed" and "degenerate".
# puts "handedness"
puts result
