# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

value_to_reach = gets.to_i
n = gets.to_i
inputs = gets.split
counts = []
n.times do |i|
  count = inputs[i].to_i
  counts << count
end
inputs = gets.split
values = []
n.times do |i|
  value = inputs[i].to_i
  values << value
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

count_values = counts.zip(values).sort_by { |_c, v| v }

sum_value = count_values.sum { |c, v| c * v }
result =
  if sum_value < value_to_reach
    -1
  else
    temp_value_to_reach = value_to_reach.to_f

    sum_count = 0
    count_values.each do |c, v|
      pay_count = [(temp_value_to_reach / v).ceil, c].min

      sum_count += pay_count
      temp_value_to_reach -= pay_count * v

      break if temp_value_to_reach <= 0
    end

    sum_count
  end

# puts "-1"
puts result
