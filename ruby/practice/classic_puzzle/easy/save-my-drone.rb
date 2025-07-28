# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_x = gets.to_i
y = gets.to_i
r = gets.to_i
rows = []
y.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

tile_names = {
  '#': 'Block',
  '^': 'Thruster',
  '@': 'Gyroscope',
  '+': 'Fuel',
  '§': 'Core'
}

tiles_str = rows.join.delete('^#^@+§')
tiles_str.reverse! if r == 1

splited_per_tiles = tiles_str.scan(/#+|\^+|@+|\++|§+/)
data_array = splited_per_tiles.map do |tiles|
  "#{tiles.length} #{tile_names[tiles.chr.to_sym]}#{'s' if tiles.length > 1}"
end

result = data_array.any? ? data_array.join(', ') : 'Nothing'

# puts "answer"
puts result
