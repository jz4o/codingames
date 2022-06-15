$stdout.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

width, height = gets.split.collect(&:to_i)
lines = []
height.times do
  line = gets.chomp
  lines << line
end
height.times do |h|
  # Write an action using puts
  # To debug: STDERR.puts "Debug messages..."

  result = ''
  width.times do |w|
    value = lines[h][w]
    result += value and next if value == '#'

    around_chars = []
    around_chars << lines[h.pred][w] unless h.zero?
    around_chars << lines[h][w.pred] unless w.zero?
    around_chars << lines[h][w.next] unless w.next == width
    around_chars << lines[h.next][w] unless h.next == height
    result += around_chars.count('0').to_s
  end

  # puts "#####"
  puts result
end
