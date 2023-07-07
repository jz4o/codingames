# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

input = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

input_elements = input.split
direction = input_elements.shift
how_many_arrows = input_elements.shift.to_i
height_of_arrows = input_elements.shift.to_i
stroke_thickness_of_arrows = input_elements.shift.to_i
spacing_between_arrows = input_elements.shift.to_i
additional_indent_of_each_line = input_elements.shift.to_i

results = (0...height_of_arrows).map do |index|
  direction_is_right = direction == 'right'

  arrow_parts = direction_is_right ? '>' : '<'
  arrow_parts *= stroke_thickness_of_arrows

  space_parts = ' ' * spacing_between_arrows

  center_row_index = height_of_arrows / 2
  indent_nest_size =
    if direction_is_right
      center_row_index - (center_row_index - index).abs
    else
      (center_row_index - index).abs
    end
  indent_parts = ' ' * additional_indent_of_each_line * indent_nest_size

  indent_parts + ([arrow_parts] * how_many_arrows).join(space_parts)
end

# puts "The Turn Here Sign"
results.each do |result|
  puts result
end
