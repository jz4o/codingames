$stdout.sync = true # DO NOT REMOVE
# The while loop represents the game.
# Each iteration represents a turn of the game
# where you are given inputs (the heights of the mountains)
# and where you have to print an output (the index of the mountain to fire on)
# The inputs you are given are automatically updated according to your last actions.

# game loop
loop do
  target_h  = 0
  target_id = 0

  8.times do |i|
    mountain_h = gets.to_i # represents the height of one mountain
    if target_h < mountain_h
      target_h = mountain_h
      target_id = i
    end
  end

  # Write an action using puts
  # To debug: STDERR.puts "Debug messages

  # puts target_id # The index of the mountain to fire on.
  puts target_id
end
