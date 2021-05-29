# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Node
  attr_accessor :index, :child_index_l, :child_index_r

  def initialize(index, child_index_l, child_index_r)
    @index = index
    @child_index_l = child_index_l
    @child_index_r = child_index_r
  end

  def has?(node_index)
    [@child_index_l, @child_index_r].include? node_index
  end

  def direction(child_node_index)
    return nil unless has? child_node_index

    @child_index_l == child_node_index ? 'Left' : 'Right'
  end
end

_n = gets.to_i
v = gets.to_i
m = gets.to_i
nodes = []
m.times do
  p, l, r = gets.split.collect(&:to_i)

  nodes << Node.new(p, l, r)
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

root = []

target_node_index = v
while parent_node = nodes.find { |node| node.has? target_node_index } do
  root.unshift parent_node.direction target_node_index
  target_node_index = parent_node.index
end

# puts "tree_path"
puts root.empty? ? 'Root' : root.join(' ')
