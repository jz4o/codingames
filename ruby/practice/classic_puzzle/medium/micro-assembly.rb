# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b, c, d = gets.split.collect(&:to_i)
@n = gets.to_i
instructions = []
@n.times do
  instructions << gets.chomp
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts a b c d"

index = 0
while index < instructions.size do
  operator, *args = instructions[index].split

  # convert positive and negative for substract by addition
  args[2].prepend '-' if operator == 'SUB'

  if operator == 'JNE'
    index = args[0].to_i and next if instance_eval [args[1], '!=', args[2]].join
  else
    instance_eval [args[0], '=', args[1], '+', args[2] || 0].join
  end

  index = index.next
end

puts [a, b, c, d].join(' ')
