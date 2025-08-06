# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n, g = gets.split.map(&:to_i)
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class TicTacToe
  Cell = Struct.new :row_index, :column_index, :value
  JudgeResult = Struct.new :message, :grid

  PLAYER_MARKS = %w[X O].freeze
  EMPTY = ' '.freeze

  def initialize(rows, g)
    @grid = rows.map.with_index do |row, row_index|
      row.chars.map.with_index do |value, column_index|
        Cell.new row_index, column_index, value
      end
    end
    @size = rows.size
    @g = g
  end

  def judge
    dup_grid = Marshal.load(Marshal.dump(@grid))

    check_methods = %i[
      check_rows
      check_columns
      check_diagonal_left_bottom_to_right_top
      check_diagonal_left_top_to_right_bottom
    ]
    check_methods.each do |check_method|
      result = method(check_method).call dup_grid
      next if result.nil?

      return result
    end

    is_filled = @grid.flatten.map(&:value).count(EMPTY).zero?

    result_message = "The game #{is_filled ? 'ended in a draw!' : 'isn\'t over yet!'}"
    result_grid = dup_grid.map { |row| row.map(&:value) }

    JudgeResult.new result_message, result_grid
  end

  private

  def check_rows(grid)
    grid.each do |row|
      row_values = row.map(&:value)

      PLAYER_MARKS.each do |mark|
        next unless row_values.join.include?(mark * @g)

        row_values.join.sub(mark * @g, '-' * @g).chars.each_with_index do |value, index|
          row[index].value = value
        end

        result_grid = grid.map { |row| row.map(&:value) }
        return JudgeResult.new "The winner is #{mark}.", result_grid
      end
    end

    nil
  end

  def check_columns(grid)
    transposed_grid = grid.transpose
    transposed_grid.each do |column|
      column_values = column.map(&:value)

      PLAYER_MARKS.each do |mark|
        next unless column_values.join.include?(mark * @g)

        column_values.join.sub(mark * @g, '|' * @g).chars.each_with_index do |value, index|
          column[index].value = value
        end

        result_grid = transposed_grid.transpose.map { |row| row.map(&:value) }
        return JudgeResult.new "The winner is #{mark}.", result_grid
      end
    end

    nil
  end

  def check_diagonal_left_bottom_to_right_top(grid)
    (0..((@size - 1) * 2)).each do |index_value|
      diagonal_cells = grid.flatten
                           .filter { |cell| cell.row_index + cell.column_index == index_value }
                           .sort_by(&:row_index)
      diagonal_values = diagonal_cells.map(&:value)

      PLAYER_MARKS.each do |mark|
        next unless diagonal_values.join.include?(mark * @g)

        diagonal_values.join.sub(mark * @g, '/' * @g).chars.each_with_index do |value, index|
          diagonal_cells[index].value = value
        end

        result_grid = grid.map { |row| row.map(&:value) }
        return JudgeResult.new "The winner is #{mark}.", result_grid
      end
    end

    nil
  end

  def check_diagonal_left_top_to_right_bottom(grid)
    ((-(@size - 1))..(@size - 1)).each do |index_value|
      diagonal_cells = grid.flatten
                           .filter { |cell| cell.row_index - cell.column_index == index_value }
                           .sort_by(&:row_index)
      diagonal_values = diagonal_cells.map(&:value)

      PLAYER_MARKS.each do |mark|
        next unless diagonal_values.join.include?(mark * @g)

        diagonal_values.join.sub(mark * @g, '\\' * @g * 2).chars.each_with_index do |value, index|
          diagonal_cells[index].value = value
        end

        result_grid = grid.map { |row| row.map(&:value) }
        return JudgeResult.new "The winner is #{mark}.", result_grid
      end
    end

    nil
  end
end

tictactoe = TicTacToe.new rows, g
tictactoe_result = tictactoe.judge

results = [
  tictactoe_result.grid.map(&:join),
  tictactoe_result.message
]

# puts "Answer"
results.each do |result|
  puts result
end
