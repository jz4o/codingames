# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

mode = gets.chomp
n = gets.to_i
player_rows = []
n.times do
  name, hand = gets.split
  player_rows << [name, hand]
end
d = gets.to_i
dicts = []
d.times do
  dict = gets.chomp
  dicts << dict
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

PlayerResult = Struct.new :name, :score, :word

letter_scoring = {}
letter_scoring.merge!(%w[a e i l n o r s t u].to_h { |l| [l, 1] })
letter_scoring.merge!(%w[d g].to_h { |l| [l, 2] })
letter_scoring.merge!(%w[b c m p].to_h { |l| [l, 3] })
letter_scoring.merge!(%w[f h v w y].to_h { |l| [l, 4] })
letter_scoring.merge!(%w[k].to_h { |l| [l, 5] })
letter_scoring.merge!(%w[j x].to_h { |l| [l, 8] })
letter_scoring.merge!(%w[q z].to_h { |l| [l, 10] })

convert_sorted_word_to_origin_words = dicts.sort.reverse.to_h { |word| [word.chars.sort.join, word] }

player_results = player_rows.filter_map do |name, hand|
  sorted_hand = hand.chars.sort.join
  next unless convert_sorted_word_to_origin_words.key? sorted_hand

  word = convert_sorted_word_to_origin_words[sorted_hand]
  score = word.chars.sum { |l| letter_scoring[l] }

  PlayerResult.new name, score, word
end

scores = player_results.map(&:score)
win_score = mode == 'high' ? scores.max : scores.min

results = player_results.filter_map do |player_result|
  next if player_result.score != win_score

  "#{player_result.name} #{player_result.word}"
end

# puts "winner_name winner_word"
results.each do |result|
  puts result
end
