# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp

  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

IndentCombination = Struct.new(:indent, :combination)

lines.select! { |line| %w[if else endif].include? line }

indent = 0
stack = []
lines.reverse_each do |line|
  case line
  when 'if'
    value = 1
    value *= stack.pop.combination while stack.last&.indent == indent

    # plus else combination
    value += stack.pop.combination

    indent -= 1

    stack << IndentCombination.new(indent, value)
  when 'else'
    value = 1
    value *= stack.pop.combination while stack.last&.indent == indent

    stack << IndentCombination.new(indent.pred, value)
  when 'endif'
    indent += 1
  end
end

result = stack.map(&:combination).reduce(:*) || 1

# puts "answer"
puts result
