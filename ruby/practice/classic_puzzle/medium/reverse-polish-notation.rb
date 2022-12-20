# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

_n = gets.to_i
inputs = gets.split
# for i in 0..(n-1)
#   instruction = inputs[i]
# end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

calc_operation = {
  'ADD' => :+,
  'SUB' => :-,
  'MUL' => :*,
  'DIV' => :/,
  'MOD' => :%
}

zero_check_operations = %w[DIV MOD]

stack = []
inputs.each do |input|
  case input
  when *calc_operation.keys
    l, r = stack.pop 2
    stack.push 'ERROR' and break unless l && r
    stack.push 'ERROR' and break if zero_check_operations.include?(input) && r.to_i.zero?

    stack.push l.to_i.method(calc_operation[input]).call r.to_i
  when 'POP'
    last = stack.pop
    stack.push 'ERROR' and break unless last
  when 'DUP'
    last = stack.pop
    stack.push 'ERROR' and break unless last

    stack.concat [last] * 2
  when 'SWP'
    l, r = stack.pop 2
    stack.push 'ERROR' and break unless l && r

    stack.push r, l
  when 'ROL'
    last = stack.pop.to_i
    stack.push 'ERROR' and break unless last

    array = stack.pop last
    stack.push 'ERROR' and break unless array.size == last

    stack.concat array.rotate
  else
    stack << input
  end
end

# puts "answer"
puts stack.join(' ')
