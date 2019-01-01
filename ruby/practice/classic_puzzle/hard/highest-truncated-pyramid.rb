# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

part_count = top_step_count = bottom_step_count = 1
loop do
  if part_count < @n
    bottom_step_count += 1
    part_count += bottom_step_count
  elsif @n < part_count
    part_count -= top_step_count
    top_step_count += 1
  else
    break
  end
end

(top_step_count..bottom_step_count).each do |step_count|
  puts '*' * step_count
end
