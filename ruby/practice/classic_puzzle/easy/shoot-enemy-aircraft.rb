# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Enemy = Struct.new :row_index, :column_index, :value
ENEMY_VALUES = %w[> <].freeze
enemies = lines.flat_map.with_index do |row, row_index|
  row.chars.filter_map.with_index do |value, column_index|
    Enemy.new row_index, column_index, value if ENEMY_VALUES.include? value
  end
end

LAUNCHER_VALUE = '^'.freeze
launcher_row_index = nil
launcher_column_index = nil
lines.each_with_index do |row, row_index|
  next unless row.include? LAUNCHER_VALUE

  launcher_row_index = row_index
  launcher_column_index = row.index LAUNCHER_VALUE
end

shoot_indexes = enemies.map do |enemy|
  vertical_diff = launcher_row_index - enemy.row_index
  horizontal_diff = (launcher_column_index - enemy.column_index).abs

  (vertical_diff - horizontal_diff).abs - 1
end

results = (0..shoot_indexes.max).map do |index|
  shoot_indexes.include?(index) ? 'SHOOT' : 'WAIT'
end

# puts "WAIT"
# puts "SHOOT"
results.each do |result|
  puts result
end
