# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

height = gets.to_i
width = gets.to_i
number_of_shelves = gets.to_i

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

top_left_parts = '/' * (width / 2)
top_center_parts = '^' * (width % 2)
top_right_parts = '\\' * (width / 2)
top = [top_left_parts, top_center_parts, top_right_parts].join

shelf_space_parts = "|#{' ' * (width - 2)}|"
shelf_bottom_parts = "|#{'_' * (width - 2)}|"
shelf_space_parts_count = ((height - 1) / number_of_shelves) - 1
normal_shelf = [shelf_space_parts] * shelf_space_parts_count + [shelf_bottom_parts]

expand_shelf = normal_shelf.clone
expand_shelf.unshift shelf_space_parts

expand_shelf_count = (height - 1) % number_of_shelves
normal_shelf_count = number_of_shelves - expand_shelf_count

results = []
results << top
results += (normal_shelf * normal_shelf_count)
results += (expand_shelf * expand_shelf_count)

# puts "the Bookcase"
results.each do |result|
  puts result
end
