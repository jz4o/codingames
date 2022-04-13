# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

toconvert = gets.chomp
n = gets.to_i
relations = []
n.times do
  relation = gets.chomp
  relations << relation
end

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

from, to = toconvert.split(' in ')

relation_hash = {}
relation_hash.default = []
relation_rates = {}
relation_rates.default = 1
relations.each do |relation|
  l_size, l, r_size, r = relation.scan(/(\d+)\s(.*)\s=\s(\d+)\s(.*)/).first

  relation_hash[l] = relation_hash[l] + [r]
  relation_hash[r] = relation_hash[r] + [l]

  relation_rates["#{l}->#{r}"] = Rational(r_size, l_size)
  relation_rates["#{r}->#{l}"] = Rational(l_size, r_size)
end

temp_relation_patterns = [[from]]
shortest_relations = nil
while shortest_relations.nil? && temp_relation_pattern = temp_relation_patterns.pop
  unit = temp_relation_pattern.last

  relation_hash[unit].each do |converted_unit|
    if converted_unit == to
      shortest_relations = temp_relation_pattern + [converted_unit]
      break
    end

    unless temp_relation_pattern.include? converted_unit
      temp_relation_patterns << (temp_relation_pattern + [converted_unit])
    end
  end
end

from_size = 1
to_size = 1
shortest_relations.each_cons(2) do |f, t|
  to_size *= relation_rates["#{f}->#{t}"]
end

from_size *= to_size.denominator
to_size *= to_size.denominator
to_size = to_size.to_i

result = [from_size, from, '=', to_size, to].join(' ')

# puts "result"
puts result
