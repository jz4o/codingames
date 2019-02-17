# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@width, @height = gets.split(' ').collect(&:to_i)
@count = gets.to_i
rasters = []
@height.times do
  raster = gets.chomp
  rasters << raster.chars
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "..."
# puts "write ###"

@count.times do
  rasters = rasters.map(&:sort).transpose.reverse
end
puts rasters.map(&:join)
