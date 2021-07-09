# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

chess_board = []
8.times do
  chess_row = gets.chomp

  chess_board << chess_row.split
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Piece = Struct.new(:kind, :row, :column)

enemy_kinds = %w[B N R Q]

king = nil
enemy = nil
chess_board.each_with_index do |row, row_index|
  row.each_with_index do |kind, column_index|
    king = Piece.new(kind, row_index, column_index) if kind == 'K'
    enemy = Piece.new(kind, row_index, column_index) if enemy_kinds.include? kind
  end
end

is_same_row = king.row == enemy.row
is_same_column = king.column == enemy.column
is_same_diagonal_line = (king.row - enemy.row).abs == (king.column - enemy.column).abs
result = case enemy.kind
         when 'B'
           is_same_diagonal_line
         when 'N'
           !is_same_row && !is_same_column && (king.row - enemy.row).abs + (king.column - enemy.column).abs == 3
         when 'R'
           is_same_row || is_same_column
         when 'Q'
           is_same_row || is_same_column || is_same_diagonal_line
         end

# puts "Check/No Check"
puts result ? 'Check' : 'No Check'
