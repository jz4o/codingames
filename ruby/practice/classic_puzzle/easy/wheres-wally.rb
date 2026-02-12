# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

wally_width, wally_height = gets.split.collect(&:to_i)
wally = ''
wally_height.times do
  wally_row = gets.chomp
  wally += wally_row
end
picture_width, picture_height = gets.split.collect(&:to_i)
picture_rows = []
picture_height.times do
  picture_row = gets.chomp
  picture_rows << picture_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

wally_indexes = wally.chars.filter_map.with_index { |char, index| index if char != ' ' }
wally_chars = wally.delete ' '

picture_grid = picture_rows.map(&:chars)

result = nil
(picture_height - wally_height + 1).times do |h|
  (picture_width - wally_width + 1).times do |w|
    picture_chars = picture_grid[h, wally_height]
                    .flat_map { |row| row[w, wally_width] }
                    .select
                    .with_index { |_char, index| wally_indexes.include? index }
                    .join
    result = "#{w} #{h}" and break if wally_chars == picture_chars
  end

  break if result
end

# puts "x y"
puts result
