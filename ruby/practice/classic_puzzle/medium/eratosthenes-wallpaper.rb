# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height, number = gets.split.map(&:to_i)

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

require 'prime'

wallpaper_lines = []
wallpaper_line =  ''
temp_number = number
while wallpaper_lines.size < height
  division_expression = temp_number.prime_division.flat_map { |n, c| [n] * c }.join('*')
  expression = "#{temp_number}=#{division_expression}"

  if width < expression.length
    wallpaper_lines << wallpaper_line.ljust(width, '-')
    wallpaper_lines.fill '-' * width, wallpaper_lines.size...height
  elsif wallpaper_line.length + expression.length + (wallpaper_line.empty? ? 0 : 1) <= width
    wallpaper_line += "#{',' unless wallpaper_line.empty?}#{expression}"
  else
    wallpaper_lines << wallpaper_line.ljust(width, '-')
    wallpaper_line = expression
  end

  temp_number += 1
end

results = wallpaper_lines

# puts "answer"
results.each do |result|
  puts result
end
