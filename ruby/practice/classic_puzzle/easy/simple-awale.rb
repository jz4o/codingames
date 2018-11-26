# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@op_bowls = gets.chomp.split.map(&:to_i)
@my_bowls = gets.chomp.split.map(&:to_i)
@num = gets.to_i

BOWLS_SIZE  = 7
PLAYER_SIZE = 2

bowls = [@op_bowls, @my_bowls]
seeds = bowls.last[@num].tap { bowls.last[@num] = 0 }
index = @num.next
while seeds.positive? do
  row_index = - ((index / BOWLS_SIZE) % PLAYER_SIZE).pred
  column_index = index % BOWLS_SIZE

  enemy_store = row_index.zero? && column_index == BOWLS_SIZE.pred
  index = index.next and redo if enemy_store

  bowls[row_index][column_index] += 1
  index += 1
  seeds -= 1
end

puts "#{bowls.first[0..-2].join(' ')} [#{bowls.first.last}]"
puts "#{bowls.last[0..-2].join(' ') } [#{bowls.last.last }]"
puts 'REPLAY' if (index % BOWLS_SIZE).zero?

