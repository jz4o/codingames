# Decode and execute the MiniCPU bytecode program.

program = gets.chomp # Space-separated hex bytes representing CPU instructions

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Instruction
  attr_reader :code, :operation

  def initialize(code, operation)
    @code = code
    @operation = operation
  end

  MOV = new '01', lambda { |register, register_number, value|
    register[register_number] = value
  }
  ADD = new '02', lambda { |register, register_number1, register_number2|
    register[register_number1] += register[register_number2]
  }
  SUB = new '03', lambda { |register, register_number1, register_number2|
    register[register_number1] -= register[register_number2]
  }
  MUL = new '04', lambda { |register, register_number1, register_number2|
    register[register_number1] *= register[register_number2]
  }
  INC = new '05', ->(register, register_number) { register[register_number] += 1 }
  DEC = new '06', ->(register, register_number) { register[register_number] -= 1 }
  HLT = new 'FF', nil

  ONE_ARGS = [INC, DEC].freeze
  TWO_ARGS = [MOV, ADD, SUB, MUL].freeze

  def self.from_code(code)
    [MOV, ADD, SUB, MUL, INC, DEC, HLT].find { |instruction| instruction.code == code }
  end
end

register = {
  '00' => 0,
  '01' => 0,
  '02' => 0,
  '03' => 0
}
bytes = program.split
while instruction = Instruction.from_code(bytes.shift)
  break if instruction == Instruction::HLT

  if Instruction::ONE_ARGS.include? instruction
    register_number = bytes.shift
    instruction.operation.call(register, register_number)
  elsif Instruction::TWO_ARGS.include? instruction
    register_number, value = bytes.shift 2
    value = value.to_i(16) if instruction == Instruction::MOV

    instruction.operation.call(register, register_number, value)
  end
end

results = [
  register['00'] % 256,
  register['01'] % 256,
  register['02'] % 256,
  register['03'] % 256
]

# Print the final value of each register R0, R1, R2, R3, one value per line
# puts "answer"
results.each do |result|
  puts result
end
