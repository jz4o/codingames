# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

program = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

instruction_regexp = {
  add: %r{/\$.*?/},
  sub: %r{//.*?/},
  mul_plus_one: %r{/\*\*.*?/},
  mul_minus: %r{/\*/.*?/},
  nop: %r{/\*\$},
  add_inst_count: /\$/
}

instructions = program.scan Regexp.union(instruction_regexp.values)

register = 0
inst_count = 0
is_inst_counting = false
instructions.each do |instruction|
  if instruction.match? Regexp.new("^#{instruction_regexp[:add]}$")
    register += instruction.length - 3
    inst_count += 1
  elsif instruction.match? Regexp.new("^#{instruction_regexp[:sub]}$")
    register -= (instruction.length - 3)
    inst_count += 1
  elsif instruction.match? Regexp.new("^#{instruction_regexp[:mul_plus_one]}$")
    register *= (instruction.length - 4 + 1)
    inst_count += 1
  elsif instruction.match? Regexp.new("^#{instruction_regexp[:mul_minus]}$")
    register *= ((instruction.length - 4) * -1)
    inst_count += 1
  elsif instruction.match? Regexp.new("^#{instruction_regexp[:nop]}$")
    inst_count += 1
  elsif instruction.match? Regexp.new("^#{instruction_regexp[:add_inst_count]}$")
    register += inst_count if is_inst_counting

    inst_count = 0
    is_inst_counting = !is_inst_counting
  end
end

result = register.to_s

# puts "answer"
puts result
