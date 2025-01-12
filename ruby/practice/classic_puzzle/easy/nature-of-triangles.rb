# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
input_rows = []
n.times do
  a, x_a, y_a, b, x_b, y_b, c, x_c, y_c = gets.split
  x_a = x_a.to_i
  y_a = y_a.to_i
  x_b = x_b.to_i
  y_b = y_b.to_i
  x_c = x_c.to_i
  y_c = y_c.to_i

  input_rows << [a, x_a, y_a, b, x_b, y_b, c, x_c, y_c]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

RIGHT_ANGLE = 90

def calc_distance(y1, x1, y2, x2)
  diff_y = (y1 - y2).abs
  diff_x = (x1 - x2).abs
  return diff_y if diff_x.zero?
  return diff_x if diff_y.zero?

  Math.sqrt(diff_y**2 + diff_x**2)
end

def calc_angle(target, other1, other2)
  Math.acos((other1**2 + other2**2 - target**2) / (2 * other1 * other2)) * 180 / Math::PI
end

def get_article(next_word)
  next_word.start_with?(/[aeiou]/) ? 'an' : 'a'
end

results = input_rows.map do |input_row|
  a, x_a, y_a, b, x_b, y_b, c, x_c, y_c = input_row

  vertex_names = [a, b, c]

  distance_a = calc_distance y_b, x_b, y_c, x_c
  distance_b = calc_distance y_a, x_a, y_c, x_c
  distance_c = calc_distance y_a, x_a, y_b, x_b
  distances = [distance_a, distance_b, distance_c]
  side_nature =
    if distances.uniq.size == 3
      'scalene'
    else
      vertex_index = distances.index { |distance| distances.count(distance) == 1 }
      vertex_name = vertex_names[vertex_index]

      "isosceles in #{vertex_name}"
    end
  side_article = get_article side_nature

  # round for adjust accuracy
  angle_a = calc_angle(distance_a, distance_b, distance_c).round 1
  angle_b = calc_angle(distance_b, distance_a, distance_c).round 1
  angle_c = calc_angle(distance_c, distance_a, distance_b).round 1
  angles = [angle_a, angle_b, angle_c]
  angle_nature =
    if right_angle_index = angles.index(RIGHT_ANGLE)
      vertex = [a, b, c][right_angle_index]

      "right in #{vertex}"
    elsif obtuse_vertex_index = angles.index { |angle| angle > RIGHT_ANGLE }
      vertex_name = vertex_names[obtuse_vertex_index]
      angle = angles[obtuse_vertex_index].round

      "obtuse in #{vertex_name} (#{angle}°)"
    else
      'acute'
    end
  angle_article = get_article angle_nature

  "#{vertex_names.join} is #{side_article} #{side_nature} and #{angle_article} #{angle_nature} triangle."
end

# puts "answer"
results.each do |result|
  puts result
end
