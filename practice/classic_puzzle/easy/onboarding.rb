STDOUT.sync = true # DO NOT REMOVE

# game loop
loop do
  enemy_1 = gets.chomp # name of enemy 1
  dist_1  = gets.to_i  # distance to enemy 1
  enemy_2 = gets.chomp # name of enemy 2
  dist_2  = gets.to_i  # distance to enemy 2

  # Write an action using puts
  if dist_1 < dist_2
    puts enemy_1
  else
    puts enemy_2
  end

  # Enter the code here
end

