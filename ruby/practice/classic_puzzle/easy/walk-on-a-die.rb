# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

lines = []
3.times do
  line = gets.chomp # One line out of three in the string describing the starting position.
  lines << line
end
commands = gets.chomp # The sequence of ULDR-characters describing the steps to perform.

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Dice
  attr_reader :on

  def initialize(numbers_string)
    @front, @left, @on, @right, @opposite, @behind = numbers_string.chars
  end

  def move!(commands)
    commands.chars.each { |command| method(command.downcase.to_sym).call }
  end

  def move_to_forward!
    @front, @on, @opposite, @behind = @opposite, @front, @behind, @on
  end
  alias_method :u, :move_to_forward!

  def move_to_backward!
    @front, @left, @on, @right, @opposite, @behind = @opposite, @right, @behind, @left, @front, @on
  end
  alias_method :d, :move_to_backward!

  def move_to_left!
    @front, @left, @on, @right, @opposite, @behind = @opposite, @behind, @left, @front, @right, @on
  end
  alias_method :l, :move_to_left!

  def move_to_right!
    @front, @left, @on, @right, @opposite, @behind = @opposite, @front, @right, @behind, @left, @on
  end
  alias_method :r, :move_to_right!
end

dice = Dice.new lines.join.delete(' ')
dice.move! commands

result = dice.on

# The number on the side you end up on after having performed `commands`.
# puts "number"
puts result
