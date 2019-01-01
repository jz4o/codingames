# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n, @k = gets.split(' ').collect(&:to_i)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

results = []
temps = (1..@k).map { |k| [k] }
while temps.any?
  temp = temps.pop
  if temp.sum == @n
    results << temp
  elsif temp.sum < @n
    (1..@k).each do |k|
      temps << temp + [k]
    end
  end
end

results.reverse_each do |result|
  puts result.join(' ')
end
