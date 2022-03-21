# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
lines = []
n.times do
  line = gets.chomp

  lines << line
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Mass = Struct.new(:y, :x, :value, :explosion)

def explosion_a_bomb(grid, bomb_mass)
  ((bomb_mass.y - 3)..(bomb_mass.y + 3)).each do |y|
    ((bomb_mass.x - 3)..(bomb_mass.x + 3)).each do |x|
      diff_y = (bomb_mass.y - y).abs
      diff_x = (bomb_mass.x - x).abs
      max_diff = [diff_y, diff_x].max

      value = 4 - max_diff

      grid[y][x].value = [grid[y][x].value, value].max unless grid[y][x].value.to_s.match?(/[A-Z]/)
      grid[y][x].explosion = true
    end
  end
end

def explosion_h_bomb(grid, bomb_mass)
  value = 5

  ((bomb_mass.y - 3)..(bomb_mass.y + 3)).each do |y|
    ((bomb_mass.x - 3)..(bomb_mass.x + 3)).each do |x|
      grid[y][x].value = [grid[y][x].value, value].max unless grid[y][x].value.to_s.match?(/[A-Z]/)
      grid[y][x].explosion = true
    end
  end
end

def explosion_b_bomb(grid, bomb_mass)
  (1..3).each do |n|
    explosion_masses = [
      grid[bomb_mass.y - n][bomb_mass.x],
      grid[bomb_mass.y + n][bomb_mass.x],
      grid[bomb_mass.y][bomb_mass.x - n],
      grid[bomb_mass.y][bomb_mass.x + n]
    ]

    value = 4 - n
    explosion_masses.each do |explosion_mass|
      explosion_mass.value = [explosion_mass.value, value].max unless explosion_mass.value.to_s.match?(/[A-Z]/)
      explosion_mass.explosion = true
    end
  end
end

grid = lines.map(&:chars)

grid.map! { |row| [*Array.new(3, 0), *row, *Array.new(3, 0)] }
3.times do
  grid.unshift Array.new(n + 6, 0)
  grid.push Array.new(n + 6, 0)
end

grid = grid.map.with_index do |row, row_index|
  row.map.with_index do |value, column_index|
    Mass.new row_index, column_index, (value.to_s.match?(/\d/) ? value.to_i : value), false
  end
end

a_bomb_masses = grid.flatten.filter { |mass| mass.value == 'A' }
a_bomb_masses.each { |bomb_mass| explosion_a_bomb grid, bomb_mass }

h_bomb_masses = grid.flatten.filter { |mass| mass.value == 'H' }
h_bomb_masses.each { |bomb_mass| explosion_h_bomb grid, bomb_mass }

explosion_b_bomb_masses = grid.flatten.filter { |mass| mass.value == 'B' && mass.explosion }
unexplosion_b_bomb_masses = grid.flatten.filter { |mass| mass.value == 'B' && !mass.explosion }
explosion_b_bomb_masses.each { |bomb_mass| explosion_b_bomb grid, bomb_mass }

is_explosion = true
while is_explosion
  is_explosion = false

  unexplosion_b_bomb_masses.each do |bomb_mass|
    next unless bomb_mass.explosion

    explosion_b_bomb grid, bomb_mass
    unexplosion_b_bomb_masses.delete bomb_mass

    is_explosion = true
  end
end

results = grid[3...-3].map do |row|
  row[3...-3].map(&:value).join
end

# puts "answer"
results.each do |result|
  puts result
end
