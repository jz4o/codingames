# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@alignment = gets.chomp
@n = gets.to_i
text = []
@n.times do
  text << gets.chomp
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

width = text.map(&:length).max

case @alignment
when 'LEFT'
  text.each { |line| puts line }
when 'RIGHT'
  text.each { |line| puts format("%#{width}s", line) }
when 'CENTER'
  text.each { |line| puts "#{' ' * ((width - line.size) / 2)}#{line}" }
when 'JUSTIFY'
  text.each do |line|
    next puts line if width == line.size

    words = line.split(' ')
    space_size = width - words.join.size
    each_space_size = space_size / (words.size - 1).to_f
    space_sizes = (1...(words.size)).map do |i|
      (each_space_size * i).floor - (each_space_size * (i - 1)).floor
    end

    puts words.map { |word| "#{word}#{' ' * space_sizes.shift.to_i}" }.join
  end
end
