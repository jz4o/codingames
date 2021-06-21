# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

grid = []
10.times do
  row = gets.chomp

  grid << ['#', *row.chars, '#']
end
wall_row = ['#'] * grid.first.size
grid = wall_row + grid + wall_row

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Position = Struct.new(:y, :x)
mother_position = nil
grid.each_with_index do |row, row_index|
  column_index = row.index 'M'

  next unless column_index

  mother_position = Position.new row_index, column_index
  grid[row_index][column_index] = '.'

  break
end

check_positions = [mother_position]

turn = 0
catch :search do
  loop do
    next_check_positions = []
    check_positions.each do |check_position|
      position = grid[check_position.y][check_position.x]

      throw :search if position == 'C'
      next unless position == '.'

      grid[check_position.y][check_position.x] = turn
      next_check_positions.push Position.new(check_position.y - 1, check_position.x)
      next_check_positions.push Position.new(check_position.y, check_position.x - 1)
      next_check_positions.push Position.new(check_position.y, check_position.x + 1)
      next_check_positions.push Position.new(check_position.y + 1, check_position.x)
    end

    check_positions = next_check_positions

    turn += 1
  end
end

# puts "shortest distance in km"
puts "#{turn * 10}km"
