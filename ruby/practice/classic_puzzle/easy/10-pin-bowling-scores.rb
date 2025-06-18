# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
games = []
n.times do
  game = gets.chomp
  games << game
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Score = Struct.new :point, :frame

results = games.map do |game|
  scores = game.split.flat_map.with_index do |score, frame|
    score.chars.map { |s| Score.new s, frame }
  end

  scores.each_with_index do |score, index|
    score.point =
      case score.point
      when '-'
        0
      when '/'
        bonus_point = score.frame < 9 ? scores[index.next].point.sub('X', '10').to_i : 0

        10 - scores[index.pred].point.to_i + bonus_point
      when 'X'
        bonus_points = score.frame < 9 ? scores[index.next..(index + 2)].map(&:point) : []
        bonus_point = bonus_points.include?('/') ? 10 : bonus_points.sum { |point| point.sub('X', '10').to_i }

        10 + bonus_point
      else
        score.point.to_i
      end
  end

  points = scores.chunk(&:frame).map { |_frame, chunk_scores| chunk_scores.sum(&:point) }
  (0...points.size).map { |index| points[..index].sum }.join(' ')
end

# puts "5 13 18 26 31 32 34 40 47 54"
results.each do |result|
  puts result
end
