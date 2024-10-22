# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, k = gets.split.map(&:to_i)
nodes = []
n.times do
  inputs = gets.split
  node = []
  k.times do |j|
    node_value = inputs[j].to_i
    node << node_value
  end
  nodes << node
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

def get_node_shape(node)
  branches = [node]

  step = 1
  while branches.max_by(&:size).size > step
    branches = branches.flat_map do |branch|
      prefix = branch[...step]
      target_value = branch[step - 1]
      next [prefix, prefix] unless target_value

      smaller = branch[step..].filter { |value| value < target_value }
      bigger = branch[step..].filter { |value| target_value < value }

      [prefix + smaller, prefix + bigger]
    end

    step += 1
  end

  branches.map(&:size)
end

result = nodes.map { |node| get_node_shape node }.uniq.size

# puts "answer"
puts result
