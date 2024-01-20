# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

order = gets.chomp
side = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

layers = { R: 1, L: 1, U: 1, D: 1 }
across_groups = [%i[R L], %i[U D]]

order.chars.map(&:to_sym).each do |o|
  across_groups.each do |across_group|
    if across_group.include? o
      layers[(across_group - [o]).first] += layers[o]
    else
      across_group.each { |s| layers[s] *= 2 }
    end
  end

  layers[o] = 1
end

# puts "1"
puts layers[side.to_sym]
