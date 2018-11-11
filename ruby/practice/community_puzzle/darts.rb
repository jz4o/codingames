# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@size = gets.to_i
@n = gets.to_i
names = []
@n.times do
  name = gets.chomp
  names << name
end
@t = gets.to_i
throw_datas = []
@t.times do
  throw_data = gets.chomp
  throw_datas << throw_data
end

HALF_SIZE = @size / 2
score_board = names.map { |name| [name, 0] }.to_h

throw_datas.each do |throw_data|
  name, x, y = throw_data.split
  x, y = x.to_i, y.to_i

  distance_with_center = Math.sqrt(x ** 2 + y ** 2)
  distance_with_edge   = Math.sqrt((HALF_SIZE - x.abs) ** 2 + (HALF_SIZE - y.abs) ** 2)

  in_square_horizontal = (-HALF_SIZE..HALF_SIZE).include? x
  in_square_vertical   = (-HALF_SIZE..HALF_SIZE).include? y

  in_square  = in_square_horizontal && in_square_vertical
  in_circle  = distance_with_center <= HALF_SIZE
  in_diamond = distance_with_center <= distance_with_edge

  if in_diamond
    score_board[name] += 15
  elsif in_circle
    score_board[name] += 10
  elsif in_square
    score_board[name] +=  5
  end
end

score_board = score_board.to_a.sort do |l, r|
  (r.last <=> l.last).nonzero? ||
    (names.index(l.first) <=> names.index(r.first))
end

puts score_board.map { |score| score.join(' ') }

