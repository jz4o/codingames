# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_n, h = gets.split.map(&:to_i)
cubes = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

pyramid_view_cubes = []
(1..h).to_a.reverse.inject(0) do |prev_cube_count, layer|
  layer_cube_count = layer**2

  layer_cubes = cubes[prev_cube_count, layer_cube_count] || ''
  complement_array = Array.new layer, nil
  layer_top_view_cube_grid = layer_cubes.chars.each_slice(layer).map do |line_cubes|
    [*line_cubes, *complement_array].first layer
  end

  layer_front_view_cubes = layer_top_view_cube_grid.transpose.map do |line_cubes|
    line_cubes.compact.last || ' '
  end
  pyramid_view_cubes.unshift layer_front_view_cubes

  prev_cube_count + layer_cube_count
end

pyramid_width = h * 2 - 1

results = pyramid_view_cubes.map do |layer_front_view_cubes|
  layer_front_view_cubes.join(' ').center(pyramid_width).rstrip
end

# puts "pyramid"
results.each do |result|
  puts result
end
