# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

l, s, n = gets.split.collect(&:to_i)
program = ''
l.times do
  r = gets.chomp

  program.concat r
end
inputs = []
n.times do
  c = gets.to_i

  inputs << c
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class BrainFack
  def self.exec(program, array_size, inputs)
    program.delete! '^><+-.,[]'

    array = Array.new(array_size, 0)
    pointer = 0

    output = ''

    jump_index_pairs = get_jump_index_pairs program

    carriage = 0
    while carriage < program.length do
      case program[carriage]
      when '>' then pointer += 1
      when '<' then pointer -= 1
      when '+' then array[pointer] += 1
      when '-' then array[pointer] -= 1
      when '.' then output.concat array[pointer].chr
      when ',' then array[pointer] = inputs.shift
      when '[' then carriage = jump_index_pairs[carriage] if array[pointer] == 0
      when ']' then carriage = jump_index_pairs[carriage] unless array[pointer] == 0
      end

      raise 'POINTER OUT OF BOUNDS' unless (0...array.size).cover? pointer
      raise 'INCORRECT VALUE' unless (0..255).cover? array[pointer]

      carriage += 1
    end

    output
  rescue StandardError => e
    e.message
  end

  def self.get_jump_index_pairs(program)
    jump_index_pairs = {}
    jump_index_pair_stack = []
    program.chars.each_with_index do |command, index|
      case command
      when '['
        jump_index_pair_stack << index
      when ']'
        pair_index = jump_index_pair_stack.pop
        raise 'SYNTAX ERROR' unless pair_index

        jump_index_pairs[pair_index] = index
        jump_index_pairs[index] = pair_index
      end
    end
    raise 'SYNTAX ERROR' unless jump_index_pair_stack.empty?

    jump_index_pairs
  end
  private_class_method :get_jump_index_pairs
end

result = BrainFack.exec(program, s, inputs)

# puts "answer"
puts result
