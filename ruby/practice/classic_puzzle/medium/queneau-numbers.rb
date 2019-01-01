# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "IMPOSSIBLE"

INITIAL_ARRAY = (1..@n).to_a
CENTER_INDEX  = INITIAL_ARRAY.size / 2
array         = INITIAL_ARRAY
progress_log  = []

@n.times do
  front_half = array[0...CENTER_INDEX]
  back_half  = array[CENTER_INDEX..-1]
  array      = back_half.reverse.zip(front_half).flatten.compact
  progress_log << array.join(',')
end

puts array == INITIAL_ARRAY ? progress_log : :IMPOSSIBLE
