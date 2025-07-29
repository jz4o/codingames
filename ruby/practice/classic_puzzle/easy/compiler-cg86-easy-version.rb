# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

expression = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Instruction = Struct.new :type, :operand

expression_elements = expression.split
expression_elements.unshift '+' if expression_elements.first.match?(/\d/)

instructions = expression_elements.each_slice(2).map do |type, operand|
  Instruction.new type, operand
end

results = []
while instruction = instructions.first
  repeat_count = instructions.count instruction
  results << "REPEAT #{repeat_count}" if repeat_count > 1

  results << "#{instruction.type == '+' ? 'ADD' : 'SUB'} cgx #{instruction.operand}"

  instructions.delete instruction
end
results << 'EXIT'

# puts "ADD cgx 1"
# puts "write EXIT"
results.each do |result|
  puts result
end
