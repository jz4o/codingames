# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@r = gets.to_i.digits(2)
@n = gets.to_i
@start_pattern = gets.chomp.tr('@.', '10')

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts ".....@.@....."

RULE_LENGTH = 8
rule = (0...RULE_LENGTH).map do |i|
  [format('%03d', i.to_s(2)), @r[i].to_i.to_s]
end.to_h

@n.times do
  puts @start_pattern.tr('10', '@.')

  result = []
  [@start_pattern[-1], *@start_pattern.chars, @start_pattern[0]].each_cons(3) do |group|
    result << rule[group.join]
  end
  @start_pattern = result.join.tap { result.clear }
end
