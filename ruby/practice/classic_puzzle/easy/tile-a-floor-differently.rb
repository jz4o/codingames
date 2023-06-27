# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

quarter_size = gets.to_i
rows = []
quarter_size.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class TileFloor
  class << self
    def create(pattern_parts)
      pattern_parts_size = pattern_parts.size
      border_row = "+#{'-' * (pattern_parts_size * 2)}+#{'-' * (pattern_parts_size * 2)}+"

      pattern_rows = reverse_horizontal pattern_parts
      pattern_rows = reverse_vertical pattern_rows
      pattern_rows.map! { |pattern_row| "|#{pattern_row}|#{pattern_row}|" }

      [border_row, pattern_rows, border_row, pattern_rows, border_row].flatten
    end

    def reverse_horizontal(pattern_parts_rows)
      pattern_parts_rows.map do |pattern_parts_row|
        reverse_pattern_parts_row = pattern_parts_row.reverse.tr('bdpq/\\', 'dbqp\\\\/')

        [pattern_parts_row, reverse_pattern_parts_row].join
      end
    end

    def reverse_vertical(pattern_parts_rows)
      reverse_pattern_parts_rows = pattern_parts_rows.reverse
      reverse_pattern_parts_rows.map! do |reverse_pattern_parts_row|
        reverse_pattern_parts_row.tr('bdpq/\\', 'pqbd\\\\/')
      end

      pattern_parts_rows + reverse_pattern_parts_rows
    end
  end
end

results = TileFloor.create rows

# puts "Tile Floor"
results.each do |result|
  puts result
end
