# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
rows = []
n.times do
  row = gets.chomp
  rows << row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

class TileFloor
  class << self
    def create(pattern_parts)
      pattern_parts_size = pattern_parts.size
      border_row = "+#{'-' * (pattern_parts_size * 2 - 1)}+#{'-' * (pattern_parts_size * 2 - 1)}+"

      pattern_rows = reverse_horizontal pattern_parts
      pattern_rows = reverse_vertical pattern_rows
      pattern_rows.map! { |pattern_row| "|#{pattern_row}|#{pattern_row}|" }

      [border_row, pattern_rows, border_row, pattern_rows, border_row].flatten
    end

    def reverse_horizontal(pattern_parts_rows)
      pattern_parts_rows.map do |pattern_parts_row|
        reverse_pattern_parts_row = pattern_parts_row.reverse.tr('(){}[]<>/\\', ')(}{][><\\\\/')

        [pattern_parts_row, reverse_pattern_parts_row[1..]].join
      end
    end

    def reverse_vertical(pattern_parts_rows)
      reverse_pattern_parts_rows = pattern_parts_rows.reverse
      reverse_pattern_parts_rows.map! do |reverse_pattern_parts_row|
        reverse_pattern_parts_row.tr('\^vAVwmWMun/\\', 'v^VAmwMWnu\\\\/')
      end

      pattern_parts_rows + reverse_pattern_parts_rows[1..]
    end
  end
end

results = TileFloor.create rows

# puts "TileFloor"
results.each do |result|
  puts result
end
