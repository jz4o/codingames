# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.map(&:to_i)
n = gets.to_i
input_rows = []
n.times do
  s, p = gets.split
  p = p.to_i
  input_rows << [s, p]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

clockwise_grid = Array.new(w) { ['-'] }
clockwise_grid.unshift ['+', *['|'] * h]
clockwise_grid.push ['+', *['|'] * h]

input_rows.each do |str, point|
  first_fall_direction = str.match?(/[a-z]/) ? 1 : -1

  target_point = point + 1
  fall_flag = true
  while fall_flag
    fall_flag = false

    target_row = clockwise_grid[target_point]
    first_fall_row = clockwise_grid[target_point + first_fall_direction]
    second_fall_row = clockwise_grid[target_point - first_fall_direction]

    if first_fall_row.size < target_row.size
      target_point += first_fall_direction
      fall_flag = true
    elsif second_fall_row.size < target_row.size
      target_point -= first_fall_direction
      fall_flag = true
    end
  end

  clockwise_grid[target_point] << str
end

results = clockwise_grid.map { |row| row.fill ' ', row.size..h }
                        .map(&:reverse)
                        .transpose
                        .map(&:join)

# puts "answer"
results.each do |result|
  puts result
end
