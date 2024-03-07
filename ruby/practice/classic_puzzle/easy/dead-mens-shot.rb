# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
corner_inputs = []
n.times do
  x, y = gets.split.map(&:to_i)
  corner_inputs << [x, y]
end
m = gets.to_i
shot_inputs = []
m.times do
  x, y = gets.split.map(&:to_i)
  shot_inputs << [x, y]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

corner_inputs << corner_inputs.first

results = shot_inputs.map do |shot_x, shot_y|
  both_side_corner_arrays = []

  both_side_corner_arrays += corner_inputs.filter_map do |corner|
    corner_x, _corner_y = corner
    [corner, corner] if corner_x == shot_x
  end

  corner_inputs.each_cons(2) do |left_corner, right_corner|
    left_corner_x, _left_corner_y = left_corner
    right_corner_x, _right_corner_y = right_corner

    min_corner_x = [left_corner_x, right_corner_x].min
    max_corner_x = [left_corner_x, right_corner_x].max

    next unless min_corner_x < shot_x && shot_x < max_corner_x

    both_side_corner_arrays <<
      if left_corner_x < right_corner_x
        [left_corner, right_corner]
      else
        [right_corner, left_corner]
      end
  end

  both_side_corner_arrays.uniq!

  case both_side_corner_arrays.size
  when 0
    'miss'
  when 1
    _, corner_y = both_side_corner_arrays.flatten

    shot_y == corner_y ? 'hit' : 'miss'
  when 2
    ys = both_side_corner_arrays.map do |left_corner, right_corner|
      left_corner_x, left_corner_y = left_corner
      right_corner_x, right_corner_y = right_corner

      corners_diff_x = (right_corner_x - left_corner_x).abs
      corners_diff_y = right_corner_y - left_corner_y

      next left_corner_y if corners_diff_x.zero?

      inclination = corners_diff_y / corners_diff_x.to_f

      left_corner_y + (inclination * (shot_x - left_corner_x))
    end

    (ys.min..ys.max).cover?(shot_y) ? 'hit' : 'miss'
  end
end

# puts "hit_or_miss"
results.each do |result|
  puts result
end
