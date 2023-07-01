# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
as = []
n.times do
  a = gets.chomp
  as << a
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

RULE_HASH = {
  ROCK: {
    BEATS: :SCISSORS,
    LOSES_TO: :PAPER
  },
  SCISSORS: {
    BEATS: :PAPER,
    LOSES_TO: :ROCK
  },
  PAPER: {
    BEATS: :ROCK,
    LOSES_TO: :SCISSORS
  }
}.freeze

PlayResult = Struct.new :hand, :win_count, :start_index

double_as = as.map(&:to_sym) * 2
play_results = as.map.with_index do |a, index|
  hand = RULE_HASH[a.upcase.to_sym][:LOSES_TO]

  target_as = double_as[index, n]
  lose_index = target_as.index RULE_HASH[hand][:LOSES_TO].capitalize

  win_count = target_as[...lose_index].count RULE_HASH[hand][:BEATS].capitalize

  PlayResult.new hand, win_count, index
end

play_result = play_results.min_by { |result| [-result.win_count, result.start_index] }

results = []
results << play_result.hand.capitalize
results << play_result.start_index

# puts "Rock"
# puts "4"
results.each do |result|
  puts result
end
