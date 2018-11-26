# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@w, @h = gets.split(" ").collect {|x| x.to_i}
@x, @y = gets.split(" ").collect {|x| x.to_i}
map = []
map << Array.new(@w, nil)
@h.times do
  r = gets.chomp
  map << [nil, *r.chars, nil]
end
map << Array.new(@w, nil)

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

checked_maths  = []
be_check_maths = [[@y + 1, @x + 1]]
exit_maths = []
while be_check_maths.any?
  check_math = be_check_maths.pop
  y, x = check_math.first, check_math.last

  next if checked_maths.include?([y, x])
  checked_maths << [y, x]

  near_maths = [
    [y, x - 1], # left
    [y - 1, x], # top
    [y, x + 1], # right
    [y + 1, x]  # bottom
  ]

  near_maths.each do |ny, nx|
    math = map[ny][nx]
    if math == '.'
      be_check_maths << [ny, nx]
    elsif math.nil?
      exit_maths << [x - 1, y - 1]
    end
  end
end

puts exit_maths.size
puts exit_maths.sort.map { |math| math.join(' ') }

