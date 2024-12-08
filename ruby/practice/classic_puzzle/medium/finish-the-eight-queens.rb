# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

rows = []
8.times do
  row = gets.chomp
  rows << row
end
# 8.times do
#
#   # Write an answer using puts
#   # To debug: STDERR.puts "Debug messages..."
#
#   puts "row"
# end

class Board
  Cell = Struct.new :row_index, :column_index, :value

  BOARD_SIZE = 8
  QUEEN = 'Q'.freeze

  def initialize(rows)
    @grid = rows.map.with_index do |row, row_index|
      row.chars.map.with_index do |value, column_index|
        Cell.new row_index, column_index, value
      end
    end
    @candidate_cells = @grid.flatten

    @queen_count = 0
    queen_cells = @candidate_cells.filter { |cell| cell.value == QUEEN }
    queen_cells.each do |queen_cell|
      fill_cell queen_cell
    end
  end

  def fill
    is_filled = false
    BOARD_SIZE.times do |index|
      row_candidate_cells = @candidate_cells.filter { |cell| cell.row_index == index }
      if row_candidate_cells.size == 1
        fill_cell row_candidate_cells.first
        is_filled = true
      end

      column_candidate_cells = @candidate_cells.filter { |cell| cell.column_index == index }
      if column_candidate_cells.size == 1
        fill_cell column_candidate_cells.first
        is_filled = true
      end
    end

    is_filled
  end

  def fill_cell(cell)
    @grid[cell.row_index][cell.column_index].value = QUEEN
    @queen_count += 1

    remove_candidate_cells cell
  end

  def candidate_challenge_fill_cells
    candidates = BOARD_SIZE.times.flat_map do |index|
      [
        @candidate_cells.filter { |cell| cell.row_index == index },
        @candidate_cells.filter { |cell| cell.column_index == index }
      ]
    end
    candidates.filter(&:any?).min_by(&:size)
  end

  def finished?
    @queen_count == BOARD_SIZE
  end

  def row_values
    @grid.map { |row| row.map(&:value).join }
  end

  private

  def remove_candidate_cells(queen_cell)
    @candidate_cells.delete_if do |candidate_cell|
      candidate_cell.row_index == queen_cell.row_index ||
        candidate_cell.column_index == queen_cell.column_index ||
        (
          (candidate_cell.row_index - queen_cell.row_index).abs ==
          (candidate_cell.column_index - queen_cell.column_index).abs
        )
    end
  end
end

boards = [Board.new(rows)]
finished_board = nil
while board = boards.pop
  nil while board.fill

  if board.finished?
    finished_board = board
    break
  end

  candidate_cells = board.candidate_challenge_fill_cells
  board_row_values = board.row_values
  (candidate_cells || []).each do |cell|
    new_board = Board.new board_row_values
    new_board.fill_cell cell

    boards << new_board
  end
end

results = finished_board.row_values

results.each do |result|
  puts result
end
