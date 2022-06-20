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

Stack = Struct.new :upper_most

results = lines.map do |line|
  stacks = []
  containers = line.chars.map(&:ord)
  while container = containers.shift
    putable_stacks = stacks.filter { |stack| container <= stack.upper_most }

    if putable_stacks.any?
      putable_stacks.min_by(&:upper_most).upper_most = container
    else
      stacks << Stack.new(container)
    end
  end

  stacks.size
end

# puts "answer"
results.each do |result|
  puts result
end
