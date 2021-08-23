# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h, count_x, count_y = gets.split.collect(&:to_i)
inputs = gets.split
width_measurements = [0]
count_x.times do |i|
  x = inputs[i].to_i

  width_measurements << x
end
width_measurements << w
inputs = gets.split
height_measurements = [0]
count_y.times do |i|
  y = inputs[i].to_i

  height_measurements << y
end
height_measurements << h

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

width_counts = {}
width_counts.default = 0
width_measurements.each_with_index do |width_measurement, index|
  width_measurements[0...index].each { |width| width_counts[width_measurement - width] += 1 }
end

height_counts = {}
height_counts.default = 0
height_measurements.each_with_index do |height_measurement, index|
  height_measurements[0...index].each { |height| height_counts[height_measurement - height] += 1 }
end

result = width_counts.keys.sum { |k| width_counts[k] * height_counts[k] }

# puts "0"
puts result
