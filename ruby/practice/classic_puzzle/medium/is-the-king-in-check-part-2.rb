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
enemies = []
chess_board.each_with_index do |row, row_index|
  row.each_with_index do |kind, column_index|
    king = Piece.new(kind, row_index, column_index) if kind == 'k'
    enemies << Piece.new(kind, row_index, column_index) if enemy_kinds.include? kind
  end
end

is_check = enemies.zip(enemies.reverse).any? do |enemy, another_enemy|
  is_same_row = king.row == enemy.row
  is_same_column = king.column == enemy.column
  is_same_diagonal_line = (king.row - enemy.row).abs == (king.column - enemy.column).abs

  is_same_row_another_enemy = king.row == another_enemy.row
  is_same_column_another_enemy = king.column == another_enemy.column
  is_same_diagonal_line_another_enemy = (king.row - another_enemy.row).abs == (king.column - another_enemy.column).abs

  range_row_king_and_enemy = [king.row, enemy.row].min..[king.row, enemy.row].max
  range_column_king_and_enemy = [king.column, enemy.column].min..[king.column, enemy.column].max

  is_block_by_another_enemy_in_row =
    is_same_row_another_enemy &&
    range_column_king_and_enemy.cover?(another_enemy.column)
  is_block_by_another_enemy_in_column =
    is_same_column_another_enemy &&
    range_row_king_and_enemy.cover?(another_enemy.row)
  is_block_by_another_enemy_in_diagonal_line =
    is_same_diagonal_line_another_enemy &&
    range_row_king_and_enemy.cover?(another_enemy.row) &&
    range_column_king_and_enemy.cover?(another_enemy.column)

  is_check_row = is_same_row && !is_block_by_another_enemy_in_row
  is_check_column = is_same_column && !is_block_by_another_enemy_in_column
  is_check_diagonal_line = is_same_diagonal_line && !is_block_by_another_enemy_in_diagonal_line

  case enemy.kind
  when 'B'
    is_check_diagonal_line
  when 'N'
    !is_same_row && !is_same_column && (king.row - enemy.row).abs + (king.column - enemy.column).abs == 3
  when 'R'
    is_check_row || is_check_column
  when 'Q'
    is_check_row || is_check_column || is_check_diagonal_line
  end
end

result = is_check ? 'Check' : 'No Check'

# puts "Check/No Check"
puts result
