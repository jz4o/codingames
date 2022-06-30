# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

h, _w = gets.split.collect(&:to_i)
lines = []
h.times do
  line = gets.chomp
  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Girl = Struct.new :y, :x, :probability

girls = lines.flat_map.with_index do |line, line_index|
  line.chars.filter_map.with_index do |char, char_index|
    next unless char == 'G'

    probability = [line_index, char_index].min.fdiv(line_index**2 + char_index**2 + 1)
    Girl.new line_index, char_index, probability
  end
end

girls.sort_by!(&:probability)

not_catching_probability = 1
CATCHING_BORDER = 0.6

girl_count = 0
while girl = girls.shift
  not_catching_probability *= (1 - girl.probability)
  break if not_catching_probability < CATCHING_BORDER

  girl_count += 1
end

result = girl_count

# puts "max_girls"
puts result
