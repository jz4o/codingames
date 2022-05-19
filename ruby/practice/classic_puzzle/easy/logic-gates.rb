# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
m = gets.to_i
input_signals = {}
n.times do
  input_name, input_signal = gets.split
  input_signals[input_name] = input_signal
end
output_lines = []
m.times do
  output_name, type, input_name1, input_name2 = gets.split
  output_lines << [output_name, type, input_name1, input_name2]
end
m.times do
  # Write an answer using puts
  # To debug: STDERR.puts "Debug messages..."

  output_name, type, input_name1, input_name2 = output_lines.shift

  input_signal1 = input_signals[input_name1]
  input_signal2 = input_signals[input_name2]

  signal_chars = input_signal1.chars.zip input_signal2.chars

  output =
    case type.to_sym
    when :AND
      signal_chars.map { |chars| chars.all?('-') ? '-' : '_' }.join
    when :OR
      signal_chars.map { |chars| chars.include?('-') ? '-' : '_' }.join
    when :XOR
      signal_chars.map { |l, r| l == r ? '_' : '-' }.join
    when :NAND
      signal_chars.map { |chars| chars.all?('-') ? '_' : '-' }.join
    when :NOR
      signal_chars.map { |chars| chars.include?('-') ? '_' : '-' }.join
    when :NXOR
      signal_chars.map { |l, r| l == r ? '-' : '_' }.join
    end

  result = "#{output_name} #{output}"

  # puts "output name and signal"
  puts result
end
