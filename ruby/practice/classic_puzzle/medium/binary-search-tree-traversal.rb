# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
inputs = gets.split
vis = []
(0...n).each do |i|
  vi = inputs[i].to_i
  vis << vi
end
# 4.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "answer"
# end
class Tree
  def initialize(values)
    dup_values = values
    @root = Node.new dup_values.shift

    dup_values.each { |value| @root.add_node value }
  end

  def pre_order_values
    @root.pre_order_values.flatten.filter(&:itself)
  end

  def in_order_values
    @root.in_order_values.flatten.filter(&:itself)
  end

  def post_order_values
    @root.post_order_values.flatten.filter(&:itself)
  end

  def level_order_values
    values = []
    target_level_nodes = [@root]
    while target_level_nodes.any?
      values.concat target_level_nodes.map(&:value)
      target_level_nodes = target_level_nodes.flat_map do |node|
        [node.left, node.right].filter(&:itself)
      end
    end

    values
  end

  class Node
    attr_reader :value, :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def add_node(value)
      @left.add_node value if value < @value && @left
      @left = Node.new value if value < @value && @left.nil?
      @right.add_node value if @value < value && @right
      @right = Node.new value if @value < value && @right.nil?
    end

    def pre_order_values
      [@value, @left&.pre_order_values, @right&.pre_order_values]
    end

    def in_order_values
      [@left&.in_order_values, @value, @right&.in_order_values]
    end

    def post_order_values
      [@left&.post_order_values, @right&.post_order_values, @value]
    end

    def level_order_values
      [@left&.value, @right&.value, @left&.level_order_values, @right&.level_order_values]
    end
  end
end

tree = Tree.new vis

results = [
  tree.pre_order_values.join(' '),
  tree.in_order_values.join(' '),
  tree.post_order_values.join(' '),
  tree.level_order_values.join(' ')
]

results.each do |result|
  puts result
end
