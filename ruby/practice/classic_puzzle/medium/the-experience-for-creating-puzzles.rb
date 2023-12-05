# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@level = gets.to_i
@xp = gets.to_i
@n = gets.to_i

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

# puts "answer"

EXP_OF_PUZZLE = 300

# reflect experience value
#
# @param Integer level       current level
# @param Integer exp         experience value
# @param Integer levelup_exp necessary experience value for level up
#
# @return Array(level, exp)
#           level  level after reflect experience value
#           exp    necessary experience value for next level up
def reflect_exp(level, exp, levelup_exp = nil)
  exp -= levelup_exp || get_exp_for_levelup(level)
  exp.negative? ? [level, -exp] : reflect_exp(level + 1, exp)
end

def get_exp_for_levelup(current_level)
  (current_level * Math.sqrt(current_level) * 10).floor
end

puts reflect_exp @level, EXP_OF_PUZZLE * @n, @xp
