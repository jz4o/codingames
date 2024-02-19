# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

pitch_rows = []
15.times do
  pitch_row = gets.chomp
  pitch_rows << pitch_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Player = Struct.new :y, :x, :team, :is_active

HALFWAY_LINE_X = 25

ball = pitch_rows.join.match(/o/i).to_s
ball_y = pitch_rows.index { |pitch_row| pitch_row.include? ball }
ball_x = pitch_rows[ball_y].index ball

players = pitch_rows.flat_map.with_index do |pitch_row, row_index|
  pitch_row.chars.filter_map.with_index do |value, value_index|
    next unless value.match?(/a|b/i)

    team = value.downcase
    is_active = value == value.upcase

    Player.new row_index, value_index, team, is_active
  end
end

a_players = players.filter { |player| player.team == 'a' }.sort_by(&:x)
b_players = players.filter { |player| player.team == 'b' }.sort_by(&:x)

offside_position_players =
  if [0, 14].include? ball_y
    []
  elsif ball == 'o'
    second_b_player_x = b_players[1].x

    border = [HALFWAY_LINE_X, ball_x, second_b_player_x].min
    a_players.filter { |player| player.x < border }
  else
    second_a_player_x = a_players[-2].x

    border = [HALFWAY_LINE_X, ball_x, second_a_player_x].max
    b_players.filter { |player| player.x > border }
  end
offside_players = offside_position_players.filter(&:is_active)

offside_position_players_result =
  if offside_position_players.empty?
    'No player in an offside position.'
  else
    "#{offside_position_players.size} player(s) in an offside position."
  end
offside_players_result = "VAR: #{offside_players.empty? ? 'ONSIDE!' : 'OFFSIDE!'}"

results = []
results << offside_position_players_result
results << offside_players_result

# puts "Offside Positions"
# puts "write VAR Decision"
results.each do |result|
  puts result
end
