# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

a, b = gets.split.collect(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

temp_a = a
temp_b = b

results = []
loop do
  r = temp_a % temp_b

  results << "#{temp_a}=#{temp_b}*#{temp_a / temp_b}+#{r}"
  temp_a = temp_b
  temp_b = r

  break if r.zero?
end
results << "GCD(#{a},#{b})=#{temp_a}"

# puts "GCD(a,b)"
results.each do |result|
  puts result
end
