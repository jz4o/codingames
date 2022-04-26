# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@cells = []
class << @cells
  def value(cell_index)
    self[cell_index][:value] || calc(cell_index)
  end

  def arg_value(arg)
    arg.include?('$') ? value(arg[1..].to_i) : arg.to_i
  end

  def calc(cell_index)
    cell = self[cell_index]
    arg1 = arg_value cell[:arg1]
    arg2 = arg_value cell[:arg2]
    cell[:value] = case cell[:operation]
                   when 'VALUE'
                     arg1
                   when 'ADD'
                     arg1 + arg2
                   when 'SUB'
                     arg1 - arg2
                   when 'MULT'
                     arg1 * arg2
                   end
  end
end

n = gets.to_i
n.times do
  operation, arg1, arg2 = gets.split
  @cells << { operation:, arg1:, arg2: }
end
n.times do |i|
  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  # puts "1"
  puts @cells.value i
end
