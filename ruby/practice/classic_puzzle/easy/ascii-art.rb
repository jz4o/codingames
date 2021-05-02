# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@l = gets.to_i  # String Width
@h = gets.to_i  # String Height
@t = gets.chomp # String Character
row = []
@h.times do
  row << gets.chomp
end

ALPHAS = ('A'..'Z').to_a << '?'
res = Array.new(@h, '')

@t.upcase.chars.each do |s|
  str_i = ALPHAS.index(s) || ALPHAS.length - 1
  @h.times do |r|
    res[r] += row[r][@l * str_i, @l]
  end
end

puts res
