# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
# NOTE:
# In the default code, a single prize is read before the
# rest are read in a loop due to a current limitation in
# stub generation. The number of prizes is (1 + height)

height = gets.to_i
increments_rows = []
height.times do
  increments = gets.chomp
  increments_rows << increments
end
prizes = []
prize1 = gets.to_i
prizes << prize1
height.times do
  prize = gets.to_i
  prizes << prize
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

increment_grid = increments_rows.map do |increments_row|
  increments_row.chars.map(&:to_i)
end

counter_grid = []
increment_grid.each do |increment_row|
  counter_grid << increment_row.map.with_index do |increment, index|
    top_left_increment = index.zero? ? 0 : counter_grid.last[index - 1]
    top_right_increment = counter_grid.empty? ? 0 : counter_grid.last[index] || 0

    [top_left_increment, top_right_increment].max + increment
  end
end

total_counters = [0, *counter_grid.last, 0].each_cons(2).map(&:max)

possible_wins = total_counters.zip(prizes).map { |total_count, prize| total_count * prize }

result = possible_wins.max

# puts "jackpot"
puts result
