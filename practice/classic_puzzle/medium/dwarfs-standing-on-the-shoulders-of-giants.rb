# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i # the number of relationships of influence
relation_map = {}
@n.times do
  # x: a relationship of influence between two people (x influences y)
  parent, child = gets.split(" ").collect {|x| x.to_i}
  relation_map[parent] = [] unless relation_map[parent]
  relation_map[parent] << child
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."


# The number of people involved in the longest succession of influences
# puts "2"

deep_level = 0
targets = relation_map.keys
until targets.empty? do
  deep_level += 1
  targets = targets.flat_map { |target| relation_map[target] }
  targets.compact!
end

puts deep_level

