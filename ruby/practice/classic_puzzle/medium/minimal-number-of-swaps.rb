# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
inputs = gets.delete(' ')

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

class << inputs
  def trim_trash
    self.sub!(/^1+/, '')
    self.sub!(/0+$/, '')
    self
  end

  def swap(a, b)
    self[a], self[b] = self[b], self[a]
  end
end

turn = 0
until inputs.trim_trash.size.zero? do
  turn += 1
  inputs.swap 0, -1
end

puts turn
