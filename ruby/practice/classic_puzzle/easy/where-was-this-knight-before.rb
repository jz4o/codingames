# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

pieces = gets.chomp
before_lines = []
8.times do
  sline = gets.chomp
  before_lines << sline
end
after_lines = []
8.times do
  eline = gets.chomp
  after_lines << eline
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Cell
  attr_reader :y, :x, :v, :dv

  def initialize(y, x, v)
    @y = y
    @x = x
    @v = v
    @dv = v.downcase
  end

  def coordinates
    row = 8 - @y
    column = ('a'..'h').to_a[@x]

    "#{column}#{row}"
  end
end

downcase_pieces = pieces.downcase

diff_before_cells = []
diff_after_cells = []
before_lines.each_with_index do |line, line_index|
  line.chars.each_with_index do |before_value, column_index|
    after_value = after_lines[line_index][column_index]
    next if before_value == after_value
    next if [before_value, after_value].all? { |v| !downcase_pieces.include?(v.downcase) }

    diff_before_cells << Cell.new(line_index, column_index, before_value)
    diff_after_cells << Cell.new(line_index, column_index, after_value)
  end
end
is_simple_move = [*diff_before_cells, *diff_after_cells].count { |cell| downcase_pieces.include? cell.dv } == 2

move_before_cell = nil
move_after_cell = nil
if is_simple_move
  move_before_cell = diff_before_cells.find { |cell| downcase_pieces.include? cell.dv }
  move_after_cell = diff_after_cells.find { |cell| cell.v == move_before_cell.v }
else
  move_after_cell = diff_after_cells.find { |cell| downcase_pieces.include? cell.dv }
  move_before_cell = diff_before_cells.find { |cell| cell.v == move_after_cell.v }
end

move_y = (move_before_cell.y - move_after_cell.y).abs
move_x = (move_before_cell.x - move_after_cell.x).abs
is_knight = [move_y, move_x].sort == [1, 2]

results = []
results << [move_before_cell.coordinates, is_simple_move ? '-' : 'x', move_after_cell.coordinates].join
results << (is_knight ? 'Knight' : 'Other')

# puts "answer"
results.each do |result|
  puts result
end
