# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h = gets.split.map(&:to_i)
grid = []
h.times do
  row = []
  inputs = gets.split
  w.times do |j|
    mountain_height = inputs[j].to_i
    row << mountain_height
  end
  grid << row
end
a, b = gets.split.map(&:to_i)
t = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def get_sub_grids(grid, height, width)
  column_indexes = grid.first.size.times.to_a

  sub_grids = []
  grid.each_cons(height) do |rows|
    column_indexes.each_cons(width) do |columns|
      sub_grids << rows.flat_map do |row|
        columns.map { |column| row[column] }
      end
    end
  end

  sub_grids
end

sub_grids = get_sub_grids grid, a, b
sub_grids.concat get_sub_grids(grid, b, a) if a != b

shots = sub_grids.map do |sub_grid|
  min_value = sub_grid.min
  sub_grid.sum { |v| v - min_value }
end
min_shot = shots.min

result = min_shot <= t ? min_shot : 'Not Possible'

# puts "Save the starship"
puts result
