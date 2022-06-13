# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

w, h, t1, t2, t3 = gets.split.collect(&:to_i)
first_picture_rows = []
second_picture_rows = []
h.times do
  first_picture_row, second_picture_row = gets.split

  first_picture_rows << first_picture_row
  second_picture_rows << second_picture_row
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

position_hash = first_picture_rows.join.delete('.').chars.to_h { |mark| [mark, {}] }

first_picture_rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |char, char_index|
    next if char == '.'

    position_hash[char][:first] = { y: row_index, x: char_index }
  end
end
second_picture_rows.each_with_index do |row, row_index|
  row.chars.each_with_index do |char, char_index|
    next if char == '.'

    position_hash[char][:second] = { y: row_index, x: char_index }
  end
end

position_hash.each_value do |position|
  y_speed = (position[:second][:y] - position[:first][:y]).fdiv(t2 - t1)
  x_speed = (position[:second][:x] - position[:first][:x]).fdiv(t2 - t1)

  third_y = position[:second][:y] + (y_speed * (t3 - t2)).floor
  third_x = position[:second][:x] + (x_speed * (t3 - t2)).floor

  position[:third] = { y: nil, x: nil }
  position[:third][:y] = third_y if (0..h.pred).cover? third_y
  position[:third][:x] = third_x if (0..w.pred).cover? third_x
end

third_picture_rows = Array.new(h) { ['.'] * w }
position_hash.sort.reverse_each do |mark, position|
  next unless position[:third].values.all?

  third_picture_rows[position[:third][:y]][position[:third][:x]] = mark
end

results = third_picture_rows.map(&:join)

# puts "answer"
results.each do |result|
  puts result
end
