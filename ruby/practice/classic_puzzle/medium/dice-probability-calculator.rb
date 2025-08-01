# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@expr = gets.chomp

incomplete_exprs = []
exprs = []
incomplete_exprs << @expr

class Integer
  alias :origin_gt :'>'

  def >(other)
    send(:origin_gt, other) ? 1 : 0
  end
end

while incomplete_exprs.any?
  incomplete_expr = incomplete_exprs.shift
  exprs << incomplete_expr and next unless incomplete_expr.include? 'd'

  front, possibly, back = incomplete_expr.partition(/d\d/)

  possibly.delete_prefix!('d')
  (1..possibly.to_i).each do |i|
    incomplete_exprs << [front, i, back].join
  end
end

answers = exprs.map { |expr| instance_eval expr }
answers.uniq.sort.each do |answer|
  percentage = Rational(answers.count(answer), answers.size) * 100
  puts [answer, format('%.2f', percentage)].join(' ')
end
