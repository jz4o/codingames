# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

@expr = gets.chomp

incomplete_exprs = []
exprs = []
incomplete_exprs << @expr

class Integer
  alias :'origin_>' :'>'

  def >(another)
    self.send(:'origin_>', another) ? 1 : 0
  end
end

while incomplete_exprs.any?
  expr = incomplete_exprs.shift
  exprs << expr and next unless expr.include? 'd'

  front, possibly, back = expr.partition(/d\d/)

  possibly.delete_prefix!('d')
  (1..possibly.to_i).each do |i|
    incomplete_exprs << [front, i, back].join
  end
end

answers = exprs.map { |expr| eval expr }
answers.uniq.sort.each do |answer|
  percentage = Rational(answers.count(answer), answers.size) * 100
  puts [answer, format('%.2f', percentage)].join(' ')
end
