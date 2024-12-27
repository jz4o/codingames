# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

d = gets.to_i
n = gets.to_i
inputs = gets.split
ords = []
d.times do |i|
  ord = inputs[i].to_i
  ords << ord
end
coord_rows = []
n.times do
  inputs = gets.split
  coord_row = []
  d.times do |j|
    coord = inputs[j].to_i
    coord_row << coord
  end
  coord_rows << coord_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Vector = Struct.new :id, :coordinates

vectors = coord_rows.map.with_index(1) do |coord_row, id|
  Vector.new id, coord_row
end

vectors.sort_by! do |vector|
  ords.map { |ord| vector.coordinates[ord - 1] }
end

result = vectors.map(&:id).join ' '

# puts "answer"
puts result
