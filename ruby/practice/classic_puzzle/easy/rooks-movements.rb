# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rook_position = gets.chomp
nb_pieces = gets.to_i
piece_rows = []
nb_pieces.times do
  colour, one_piece = gets.split
  colour = colour.to_i

  piece_rows << [colour, one_piece]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

BLACK = 1

piece_positions = {}
piece_rows.each do |colour, one_piece|
  column, row = one_piece.chars
  row = row.to_i

  piece_positions[column] = {} unless piece_positions.key? column
  piece_positions[column][row] = colour
end

rook_column, rook_row = rook_position.chars
rook_row = rook_row.to_i

results = []

# move to top
rook_row.pred.downto(1).each do |row_num|
  if colour = piece_positions.dig(rook_column, row_num)
    results << "R#{rook_position}x#{rook_column}#{row_num}" if colour == BLACK
    break
  end

  results << "R#{rook_position}-#{rook_column}#{row_num}"
end

# move to bottom
rook_row.next.upto(8).each do |row_num|
  if colour = piece_positions.dig(rook_column, row_num)
    results << "R#{rook_position}x#{rook_column}#{row_num}" if colour == BLACK
    break
  end

  results << "R#{rook_position}-#{rook_column}#{row_num}"
end

# move to left
('a'..'h').reverse_each do |column|
  next if rook_column.ord <= column.ord

  if colour = piece_positions.dig(column, rook_row)
    results << "R#{rook_position}x#{column}#{rook_row}" if colour == BLACK
    break
  end

  results << "R#{rook_position}-#{column}#{rook_row}"
end

# move to right
('a'..'h').each do |column|
  next if column.ord <= rook_column.ord

  if colour = piece_positions.dig(column, rook_row)
    results << "R#{rook_position}x#{column}#{rook_row}" if colour == BLACK
    break
  end

  results << "R#{rook_position}-#{column}#{rook_row}"
end

results.sort!

# puts "ANSWER"
results.each do |result|
  puts result
end
