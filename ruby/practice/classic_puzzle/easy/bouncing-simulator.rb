# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.to_i
h = gets.to_i
n = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

grid = Array.new(h) { ['#', *Array.new(w, 0), '#'] }
grid.unshift Array.new(w + 2, '#')
grid.push Array.new(w + 2, '#')

position_y = 1
position_x = 1

grid[position_y][position_x] += 1

move_y = 1
move_x = 1
hit_count = 0
while hit_count < n
  next_y = position_y + move_y
  next_x = position_x + move_x

  is_overflow_y = !(1..h).cover?(next_y)
  is_overflow_x = !(1..w).cover?(next_x)
  if is_overflow_y || is_overflow_x
    hit_count += 1

    if is_overflow_y
      move_y *= -1

      position_y = next_y if h == 1
    end

    if is_overflow_x
      move_x *= -1

      position_x = next_x if w == 1
    end

    next
  end

  position_y = next_y
  position_x = next_x

  grid[position_y][position_x] += 1
end

results = grid.map do |row|
  row.map { |cell| cell == 0 ? ' ' : cell }.join
end

# puts "Grid after n hits"
results.each do |result|
  puts result
end
