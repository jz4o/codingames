# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

r, c = gets.split.collect(&:to_i)
pixel_grid = []
r.times do
  pixel_row = []
  inputs = gets.split
  c.times do |j|
    pixel = inputs[j].to_i
    pixel_row << pixel
  end
  pixel_grid << pixel_row
end
m, n = gets.split.collect(&:to_i)
weight_grid = []
m.times do
  weight_row = []
  inputs = gets.split
  n.times do |j|
    weight = inputs[j].to_i
    weight_row << weight
  end
  weight_grid << weight_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = []
(pixel_grid.size - weight_grid.size + 1).times do |h|
  result = []
  (pixel_grid.first.size - weight_grid.first.size + 1).times do |w|
    pixel_values = pixel_grid[h, weight_grid.size].map { |row| row[w, weight_grid.first.size] }.flatten
    convolution_value = pixel_values.zip(weight_grid.flatten).sum { |pixel, weight| pixel * weight }

    result << convolution_value
  end
  results << result
end

results.map! { |result| result.join ' ' }

# puts "output matrix"
results.each do |result|
  puts result
end
