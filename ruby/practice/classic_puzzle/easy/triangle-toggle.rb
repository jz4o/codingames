# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

hi, wi = gets.split.map(&:to_i)
style = gets.chomp
how_many_triangles = gets.to_i
triangle_rows = []
how_many_triangles.times do
  x1, y1, x2, y2, x3, y3 = gets.split.map(&:to_i)
  triangle_rows << [x1, y1, x2, y2, x3, y3]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Point = Struct.new :y, :x

grid = Array.new(hi) { [0] * wi }

y_range = 0...hi
x_range = 0...wi

triangle_rows.each do |triangle_row|
  x1, y1, x2, y2, x3, y3 = triangle_row

  points = [Point.new(y1, x1), Point.new(y2, x2), Point.new(y3, x3)]

  if points.map(&:y).uniq.size == 2
    ordered_points = points.sort_by { |point| [point.y, point.x] }
    horizontal_y = ordered_points[1].y
    horizontal_left_point, horizontal_right_point = ordered_points.filter { |point| point.y == horizontal_y }
    different_y_point = points.find { |point| point.y != horizontal_y }

    clination_left = different_y_point.x == horizontal_left_point.x ? 0 : 1
    clination_right = different_y_point.x == horizontal_right_point.x ? 0 : 1

    direction_method = different_y_point.y < horizontal_y ? :upto : :downto
    different_y_point.y.method(direction_method).call(horizontal_y).each_with_index do |y, index|
      next unless y_range.cover? y

      ((different_y_point.x - clination_left * index)..(different_y_point.x + clination_right * index)).each do |x|
        next unless x_range.cover? x

        grid[y][x] += 1
      end
    end
  else
    ordered_points = points.sort_by { |point| [point.x, point.y] }
    vertical_x = ordered_points[1].x
    different_x_point = points.find { |point| point.x != vertical_x }

    direction_method = different_x_point.x < vertical_x ? :upto : :downto
    different_x_point.x.method(direction_method).call(vertical_x).each_with_index do |x, index|
      next unless x_range.cover? x

      ((different_x_point.y - index)..(different_x_point.y + index)).each do |y|
        next unless y_range.cover? y

        grid[y][x] += 1
      end
    end
  end
end

results = grid.map do |row|
  row.map { |value| value.even? ? '*' : ' ' }
     .join(style == 'expanded' ? ' ' : '')
end

# puts "rectangleWithCarvings"
results.each do |result|
  puts result
end
