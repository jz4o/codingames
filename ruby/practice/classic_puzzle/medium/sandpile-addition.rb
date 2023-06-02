# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i
map = Array.new(@n) { Array.new(@n, 0) }
(@n * 2).times do |n|
  gets.chomp.chars.each_with_index do |c, i|
    map[n % @n][i] += c.to_i
  end
end

BORDER = 4
while map.flatten.any? { |n| BORDER <= n } do
  map.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      next if column < BORDER

      map[row_index][column_index] -= BORDER
      map[row_index.pred][column_index] += 1 unless row_index.zero?               # above
      map[row_index.next][column_index] += 1 unless row_index.next == map.size    # below
      map[row_index][column_index.pred] += 1 unless column_index.zero?            # left
      map[row_index][column_index.next] += 1 unless column_index.next == row.size # right
    end
  end
end

puts map.map(&:join)
