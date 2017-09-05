# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i # the number of temperatures to analyse
@temps = gets.chomp # the n temperatures expressed as integers ranging from -273 to 5526

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

@temps = @temps.split.map{|n| n.to_i}
min = @temps.map{|n| n.abs}.min

#chekc all minus?
if @n.zero?
  puts '0'
elsif @temps.all? {|n| n < 0}
  puts "-#{min}"
else
  puts min
end

