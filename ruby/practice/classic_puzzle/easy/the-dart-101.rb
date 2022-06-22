# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
players = []
n.times do
  player = gets.chomp
  players << player
end
player_shoots = []
n.times do
  shoots = gets.chomp
  player_shoots << shoots
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

TARGET_POINT = 101
MISS_SHOOT = 'X'.freeze

reached_rounds = {}
players.zip(player_shoots).each do |player, shoots|
  point = 0
  round = 0
  shoots_array = shoots.split
  while shoots_array.any?
    round += 1

    temp_point = 0
    temp_shoots = []
    3.times do
      shoot = shoots_array.shift
      break unless shoot

      shoot_point =
        if shoot.include? '*'
          shoot.split('*').map(&:to_i).inject(:*)
        elsif shoot == MISS_SHOOT
          temp_shoots.last == MISS_SHOOT ? -30 : -20
        else
          shoot.to_i
        end

      temp_point += shoot_point

      temp_shoots << shoot

      break if TARGET_POINT <= point + temp_point
    end

    if temp_shoots.all? MISS_SHOOT
      point = 0
    elsif point + temp_point <= TARGET_POINT
      point += temp_point
    end
  end

  reached_rounds[player] = round if point == TARGET_POINT
end

result = reached_rounds.min_by { |_, v| v }.first

# puts "winner"
puts result
