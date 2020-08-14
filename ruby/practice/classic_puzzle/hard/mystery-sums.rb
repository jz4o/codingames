# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@expression = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."
factors       = @expression.partition('=')
left_formula  = factors.first
right_formula = factors.last.strip

left_factors = left_formula.split(' ')
right_factors = right_formula.split(' ')

# optimize for /
while index = left_factors.index('/') do
  right_factors.push '*', left_factors[index + 1]
  2.times { left_factors.delete_at index }
end

# optimize for *
while index = left_factors.index('*') do
  target = left_factors[(index - 1)..(index + 1)].index { |n| n =~ /\A\d+\Z/ }
  right_factors.push '/', left_factors[target]
  2.times { left_factors.delete_at [index, target].min }
end

# calc mistery num
left_factors.each do |factor|
  factor.tr!('?', '0')
  factor.sub!(/\A0(\d+)/) { $1 }
end
mistery_num = instance_eval(left_factors.join) - instance_eval(right_factors.join)

# facotrs reset
left_factors = left_formula.split(' ')

# reasoning
mistery_num.to_s.split('').reverse_each.with_index do |num, num_index|
  target = left_factors.index { |n| n =~ /\?.{#{num_index}}\Z/ }
  left_factors[target][-1 - num_index, 1] = num if target
end

# check
surplus = instance_eval(right_formula) - instance_eval(left_factors.join)
unless surplus.zero?
  surplus.to_s.split('').reverse_each.with_index do |num, num_index|
    num = num.to_i
    next if num.zero?

    target_index = left_formula.split(' ').index { |n| n =~ /\?.{#{num_index}}\Z/ }
    left_factors[target_index] = left_factors[target_index].to_i + 10**num_index * num if target_index
  end
end

# answer
puts [left_factors, '=', right_formula].join(' ')
