# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  x, y, z, r = gets.split.map(&:to_i)
  input_rows << [x, y, z, r]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Ball = Struct.new :x, :y, :z, :r

balls = input_rows.map { |x, y, z, r| Ball.new x, y, z, r }

balls.each do |ball|
  distances = balls.filter { |b| ball != b }
                   .map do |b|
                     distance_x = (ball.x - b.x).abs
                     distance_y = (ball.y - b.y).abs
                     center_point_distance_horizontal = Math.sqrt(distance_x**2 + distance_y**2)

                     distance_z = (ball.z - b.z).abs
                     center_point_distance = Math.sqrt(center_point_distance_horizontal**2 + distance_z**2)

                     center_point_distance - ball.r - b.r
                   end
  min_distance = distances.min
  next if min_distance <= 0

  ball.r += min_distance
end

result = balls.sum { |ball| ball.r**3 }.round.to_s

# puts "result"
puts result
