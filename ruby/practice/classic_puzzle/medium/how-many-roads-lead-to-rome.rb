# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
css = []
n.times do
  inputs = gets.split
  cs = []
  (0..1).each do |j|
    c = inputs[j].to_i
    cs << c
  end
  css << cs
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

PARIS_LABEL = 1
ROME_LABEL = 100

city_relations = {}
city_relations.default = []
css.each do |a, b|
  city_relations[a] = city_relations[a] + [b]
  city_relations[b] = city_relations[b] + [a]
end

route_patterns = []
temp_route_patterns = [[PARIS_LABEL]]
while temp_route_pattern = temp_route_patterns.pop
  last_city_label = temp_route_pattern.last

  city_relations[last_city_label].each do |next_city_label|
    next if temp_route_pattern.include? next_city_label

    if next_city_label == ROME_LABEL
      route_patterns << temp_route_pattern + [next_city_label]
      next
    end

    temp_route_patterns << temp_route_pattern + [next_city_label]
  end
end

result = route_patterns.size

# puts "answer"
puts result
