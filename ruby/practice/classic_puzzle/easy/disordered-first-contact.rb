# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
@message = gets.chomp

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

def decode(text)
  result = ''
  turn = 1
  turn += 1 while (1..turn).sum < text.size

  while turn.positive?
    slice_size = text.size - (1..turn.pred).sum
    if turn.odd?
      result.insert 0, text.slice!(-slice_size..-1)
    else
      result.insert 0, text.slice!(0, slice_size)
    end
    turn -= 1
  end

  result
end

def encode(text)
  result = ''
  turn = 1
  until (target = text.slice!(0, turn)).empty?
    if turn.odd?
      result << target
    else
      result.insert 0, target
    end
    turn += 1
  end

  result
end

decode_or_encode = method(@n.positive? ? :decode : :encode)
@n.abs.times { @message = decode_or_encode.call(@message) }
puts @message
