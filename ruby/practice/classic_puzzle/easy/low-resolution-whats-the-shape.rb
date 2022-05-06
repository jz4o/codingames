# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.collect(&:to_i)
rows = []
h.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

pixels = rows.join
points = pixels.count('X') + pixels.count('^\\.', '^X') / 2

pixel_size = w * h
result =
  if points == pixel_size
    'Rectangle'
  elsif points > pixel_size / 2
    'Ellipse'
  else
    'Triangle'
  end

# puts "Rectangle/Triangle/Ellipse"
puts result
