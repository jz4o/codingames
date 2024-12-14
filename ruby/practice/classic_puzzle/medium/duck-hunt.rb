# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w = gets.to_i
h = gets.to_i
first_rows = []
h.times do
  row = gets.chomp
  first_rows << row
end
second_rows = []
h.times do
  row = gets.chomp
  second_rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class Duck
  attr_reader :id, :keep_field

  def initialize(id, coordinate, h, w)
    @id = id
    @first_row_index = coordinate[:first_row_index]
    @first_column_index = coordinate[:first_column_index]
    @second_row_index = coordinate[:second_row_index]
    @second_column_index = coordinate[:second_column_index]

    @move_y = @second_row_index - @first_row_index
    @move_x = @second_column_index - @first_column_index

    keep_field_y = (h - @first_row_index) / @move_y if @move_y.positive?
    keep_field_y = @first_row_index / @move_y.abs if @move_y.negative?
    keep_field_x = (w - @first_column_index) / @move_x if @move_x.positive?
    keep_field_x = @first_column_index / @move_x.abs if @move_x.negative?

    @keep_field = [keep_field_y, keep_field_x].filter(&:itself).min || Float::INFINITY
  end

  def distance_edge(turn, h, w)
    [
      column_index(turn),
      w - column_index(turn),
      row_index(turn),
      h - row_index(turn)
    ].min
  end

  def row_index(turn)
    @first_row_index + (@move_y * turn)
  end

  def column_index(turn)
    @first_column_index + (@move_x * turn)
  end
end

coordinates = {}
first_rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |value, column_index|
    next if value == '.'

    coordinates[value] = {
      first_row_index: row_index,
      first_column_index: column_index
    }
  end
end
second_rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |value, column_index|
    next if value == '.'

    coordinates[value][:second_row_index] = row_index
    coordinates[value][:second_column_index] = column_index
  end
end
ducks = coordinates.map do |id, coordinate|
  Duck.new id, coordinate, h, w
end

ducks.sort_by!(&:keep_field)

results = []
(2..ducks.size + 1).each do |turn|
  target_keep_field = ducks.map(&:keep_field).find { |keep_field| turn <= keep_field }
  target_ducks = ducks.filter { |duck| duck.keep_field == target_keep_field }
  target_duck = target_ducks.min_by { |duck| duck.distance_edge turn, h, w }

  next unless target_duck

  results << "#{target_duck.id} #{target_duck.column_index turn} #{target_duck.row_index turn}"
  ducks.delete target_duck
end

# puts "ID x y"
results.each do |result|
  puts result
end
