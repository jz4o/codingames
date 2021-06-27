# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

Generation = Struct.new(:level, :name)

count = gets.to_i
generations = []
count.times do
  line = gets.chomp

  level = line.count('.')
  generations << Generation.new(level, line[level..])
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

reversed_generations = generations.reverse

results = []
while reversed_generations.any? do
  result = (0..(reversed_generations.first.level)).to_a.reverse.map do |l|
    reversed_generations.find { |generation| generation.level == l }.name
  end
  results.unshift result.reverse.join(' > ')

  temp = reversed_generations.shift
  temp = reversed_generations.shift while reversed_generations.any? && reversed_generations.first.level < temp.level
end

# puts "answer"
puts results
