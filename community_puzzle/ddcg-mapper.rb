# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@l = gets.to_i
@n = gets.to_i
patterns = []
tempos   = []
@n.times do
  tmp = gets.split(" ")
  patterns << tmp[0].gsub('X', '1').to_i(2)
  tempos   << tmp[1].to_i
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

results = []
1.upto(@l) do |l|
  result = 0b0000
  tempos.each.with_index do |tempo, index|
    if (l % tempo).zero?
      result |= patterns[index]
    end
  end
  results << result.to_s(2).rjust(4, '0').gsub('1', 'X')
end

puts results.reverse

