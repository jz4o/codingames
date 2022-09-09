# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

max, cycles = gets.split.collect(&:to_i)
rows = []
cycles.times do
  name, initial_count, power = gets.split
  initial_count = initial_count.to_i
  power = power.to_i

  rows << [name, initial_count, power]
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

Cell = Struct.new :name, :territory_count, :power, :index

power_cell_hash = {}
power_cell_hash.default = []
cycles.times do |cycle_index|
  all_cells = power_cell_hash.values.flatten

  remain = max - all_cells.sum(&:territory_count)
  is_conflict_territory = remain.zero?

  if is_conflict_territory
    power_cells = power_cell_hash[power_cell_hash.keys.max]

    power_cells.each do |power_cell|
      robbery_count = power_cell.territory_count / 10

      sorted_cells = all_cells.sort_by { |c| [c.power, c.territory_count] }
      robbery_cell = sorted_cells.find { |c| c.power < power_cell.power && robbery_count <= c.territory_count }

      next unless robbery_cell

      power_cell.territory_count += robbery_count
      robbery_cell.territory_count -= robbery_count
    end
  else
    power_cell_hash.keys.sort.reverse_each do |power|
      power_cells = power_cell_hash[power]

      sum_count_power_cells = power_cells.sum(&:territory_count)
      if remain < sum_count_power_cells
        power_cells.each { |power_cell| power_cell.territory_count += remain / power_cells.size }
        remain = 0
      elsif sum_count_power_cells <= remain
        power_cells.each do |power_cell|
          remain -= power_cell.territory_count
          power_cell.territory_count *= 2
        end
      end
    end
  end

  name, initial_count, power = rows.shift

  break if name == 'STOP!'

  cell = Cell.new(name, initial_count, power, cycle_index)
  power_cell_hash[cell.power] = power_cell_hash[cell.power] + [cell]
end

cells = power_cell_hash.values.flatten.sort_by(&:index).filter { |cell| cell.territory_count.positive? }
sum_territory_count = cells.sum(&:territory_count)

results = []

results << 'OVERFLOW!' if max < sum_territory_count
results << "EMPTY: #{max - sum_territory_count}" if sum_territory_count < max
results += cells.map { |cell| "#{cell.name}: #{cell.territory_count}" } if sum_territory_count <= max

# puts "The Answer: 42"
results.each do |result|
  puts result
end
