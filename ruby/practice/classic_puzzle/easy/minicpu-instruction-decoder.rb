# Decode and execute the MiniCPU bytecode program.

program = gets.chomp # Space-separated hex bytes representing CPU instructions

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class MiniCpu
  REGISTER_NUMBERS = %w[00 01 02 03].freeze

  def self.exec(program)
    @register = REGISTER_NUMBERS.to_h { |key| [key, 0] }

    bytes = program.split
    while instruction = Instruction.from_code(bytes.shift)
      break if instruction == Instruction::HLT

      if [Instruction::INC, Instruction::DEC].include? instruction
        register_number = bytes.shift
        method(instruction.operation).call register_number
      elsif [Instruction::MOV, Instruction::ADD, Instruction::SUB, Instruction::MUL].include? instruction
        register_number, value = bytes.shift 2
        value = value.to_i 16 if instruction == Instruction::MOV

        method(instruction.operation).call register_number, value
      end
    end

    @register.transform_values { |value| value % 256 }.values_at(*REGISTER_NUMBERS)
  end

  def self.mov(register_number, value)
    @register[register_number] = value
  end

  def self.add(register_number1, register_number2)
    @register[register_number1] += @register[register_number2]
  end

  def self.sub(register_number1, register_number2)
    @register[register_number1] -= @register[register_number2]
  end

  def self.mul(register_number1, register_number2)
    @register[register_number1] *= @register[register_number2]
  end

  def self.inc(register_number)
    @register[register_number] += 1
  end

  def self.dec(register_number)
    @register[register_number] -= 1
  end

  class Instruction
    attr_reader :code, :operation

    def initialize(code, operation)
      @code = code
      @operation = operation
    end

    MOV = new '01', :mov
    ADD = new '02', :add
    SUB = new '03', :sub
    MUL = new '04', :mul
    INC = new '05', :inc
    DEC = new '06', :dec
    HLT = new 'FF', nil

    def self.from_code(code)
      [MOV, ADD, SUB, MUL, INC, DEC, HLT].find { |instruction| instruction.code == code }
    end
  end
end

results = MiniCpu.exec program

# Print the final value of each register R0, R1, R2, R3, one value per line
# puts "answer"
results.each do |result|
  puts result
end
