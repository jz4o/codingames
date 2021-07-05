# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

class Player
  DECISION_TABLE = {
    'R' => {
      'R' => :draw,
      'P' => :lose,
      'C' => :win,
      'L' => :win,
      'S' => :lose
    },
    'P' => {
      'R' => :win,
      'P' => :draw,
      'C' => :lose,
      'L' => :lose,
      'S' => :win
    },
    'C' => {
      'R' => :lose,
      'P' => :win,
      'C' => :draw,
      'L' => :win,
      'S' => :lose
    },
    'L' => {
      'R' => :lose,
      'P' => :win,
      'C' => :lose,
      'L' => :draw,
      'S' => :win
    },
    'S' => {
      'R' => :win,
      'P' => :lose,
      'C' => :win,
      'L' => :lose,
      'S' => :draw
    }
  }.freeze

  attr_reader :num, :sign, :competed_nums

  def initialize(num, sign)
    @num = num
    @sign = sign
    @competed_nums = []
  end

  def compete(other)
    DECISION_TABLE[sign][other.sign]
  end
end

n = gets.to_i
players = []
n.times do
  numplayer, signplayer = gets.split
  numplayer = numplayer.to_i

  players << Player.new(numplayer, signplayer)
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

while players.size > 1
  winners = []
  players.each_slice(2) do |left, right|
    winner, loser = case left.compete(right)
                    when :win  then [left, right]
                    when :draw then [left, right].sort_by(&:num)
                    when :lose then [right, left]
                    end

    winner.competed_nums << loser.num
    winners << winner
  end

  players = winners
end

winner = players.first

# puts "WHO IS THE WINNER?"
puts winner.num
puts winner.competed_nums.join(' ')
