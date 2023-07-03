# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s = gets.chomp
n = gets.to_i
ms = []
n.times do
  m = gets.chomp
  ms << m
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

s_elements = s.split.filter { |s_element| s_element.chars.uniq.size >= 2 }
replace_from_chars = s_elements.map(&:chr).uniq

replace_hash = s_elements.to_h(&:chars)

replace_roads = replace_from_chars.to_h do |f|
  road = [f]
  while t = replace_hash[road.last]
    road << t

    break if road.count(t) >= 2
  end

  [f, road]
end

is_ambigious_error = s_elements.size != replace_from_chars.size
is_loop_error = replace_roads.values.any? { |value| value.size != value.uniq.size }

replace_from = ''
replace_to = ''
replace_roads.each do |f, replace_road|
  replace_from += f
  replace_to += replace_road.last
end

replaced_ms = ms.map { |m| m.tr replace_from, replace_to }

results = is_ambigious_error || is_loop_error ? ['ERROR'] : replaced_ms

# puts "The final figure or ERROR"
results.each do |result|
  puts result
end
