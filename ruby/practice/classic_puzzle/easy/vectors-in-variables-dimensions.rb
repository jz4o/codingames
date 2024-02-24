# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_d = gets.to_i
n = gets.to_i
points = []
n.times do
  point = gets.chomp
  points << point
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Point = Struct.new :name, :components
Vector = Struct.new :distance, :text

points.map! do |point|
  _, name, components_str = point.match(/(.*)\((.*)\)/).to_a
  components = components_str.split(',').map(&:to_i)

  Point.new name, components
end

vectors = (0..n - 1).flat_map do |left_index|
  (left_index + 1..n - 1).map do |right_index|
    left_point = points[left_index]
    right_point = points[right_index]

    component_distances = left_point.components.zip(right_point.components).map { |l, r| r - l }
    distance = Math.sqrt(component_distances.sum { |d| d**2 })

    text = "#{left_point.name}#{right_point.name}(#{component_distances.join(',')})"

    Vector.new distance, text
  end
end

results = []
results << vectors.min_by(&:distance).text
results << vectors.max_by(&:distance).text

# puts "shortest_vector"
# puts "longest_vector"
results.each do |result|
  puts result
end
