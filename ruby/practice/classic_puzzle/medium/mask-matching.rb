# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mask = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

matching_values = mask.to_i(16).to_s(2).chars.reverse.filter_map.with_index do |i, index|
  2**index if i == '1'
end

smallest_results = (1..15).filter_map do |n|
  n_digits = n.to_s(2).chars.map(&:to_i)
  next if n_digits.size > matching_values.size

  n_digits.reverse.map.with_index do |i, index|
    i * matching_values[index]
  end.sum
end

largest_results = [
  matching_values[1..].sum,
  matching_values.sum
].filter(&:positive?)

results =
  if smallest_results.include? largest_results.last
    smallest_results
  else
    [*smallest_results[...13], '...', *largest_results]
  end

result = results.join ','

# puts "Good Luck!"
puts result
