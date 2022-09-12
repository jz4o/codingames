# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

side, diameter = gets.split.collect(&:to_f)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

all_area_size = side**2
circle_area_size = (diameter / 2)**2 * Math::PI

wasteful_circle_count = (side / diameter).floor**2

remain_area_size = all_area_size - (circle_area_size * wasteful_circle_count)

frugal_circle_count = wasteful_circle_count

while diameter <= (remain_side = Math.sqrt(remain_area_size))
  add_circle_count = (remain_side / diameter).floor**2

  remain_area_size -= circle_area_size * add_circle_count
  frugal_circle_count += add_circle_count
end

result = frugal_circle_count - wasteful_circle_count

# puts "how many more biscuit"
puts result
