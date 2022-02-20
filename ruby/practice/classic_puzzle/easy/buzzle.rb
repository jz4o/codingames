# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, a, b = gets.split.collect(&:to_i)
k = gets.to_i
inputs = gets.split
nums = []
k.times do |i|
  num = inputs[i].to_i

  nums << num
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

results = []
(a..b).each do |i|
  is_buzzle = false

  # level 1
  # is_buzzle |= i.to_s.end_with? '7'
  # is_buzzle |= (i % 7).zero?

  # level 2
  # temp_i = i
  # loop do
  #   is_buzzle |= temp_i.to_s.end_with? '7'
  #   is_buzzle |= (temp_i % 7).zero?

  #   t = temp_i
  #   temp_i = temp_i.digits.sum

  #   break if temp_i == t
  # end

  # level 3
  # temp_i = i
  # loop do
  #   str_temp_i = temp_i.to_s
  #   is_buzzle |= nums.any? { |num| str_temp_i.end_with? num.to_s }
  #   is_buzzle |= nums.any? { |num| (temp_i % num).zero? }

  #   t = temp_i
  #   temp_i = temp_i.digits.sum

  #   break if temp_i == t
  # end

  # level 4
  temp_i = i
  loop do
    str_temp_i = temp_i.to_s(n)
    is_buzzle |= nums.any? { |num| str_temp_i.end_with? num.to_s(n) }
    is_buzzle |= nums.any? { |num| (temp_i % num).zero? }

    t = temp_i
    temp_i = str_temp_i.chars.sum { |c| c.to_i(n) }

    break if temp_i == t
  end

  results << (is_buzzle ? 'Buzzle' : i)
end

# puts "Buzzle"
results.each do |result|
  puts result
end
