# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

b = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

chunked_bits = b.chars.chunk(&:to_i).map do |value, results|
  { type: (value.zero? ? :negative : :positive), size: results.size }
end

sequences = []
if chunked_bits.size == 1
  # all bits is equal

  chunked_bit = chunked_bits.first
  sequences.push chunked_bit[:type] == :positive ? chunked_bit[:size] - 1 : 1
else
  # extend a positive
  sequences += chunked_bits.filter_map { |chunk| chunk[:size].next if chunk[:type] == :positive }

  # connect two positive
  chunked_bits.each_cons(3) do |previous_chunk, current_chunk, next_chunk|
    if current_chunk[:type] == :negative && current_chunk[:size] == 1
      sequences.push previous_chunk[:size] + current_chunk[:size] + next_chunk[:size]
    end
  end
end

result = sequences.max

# puts "answer"
puts result
