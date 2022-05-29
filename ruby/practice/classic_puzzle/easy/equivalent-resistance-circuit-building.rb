# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

n = gets.to_i
name_rs = []
n.times do
  name, r = gets.split
  r = r.to_i

  name_rs << [name, r]
end
circuit = gets.chomp

# Write an answer using puts
# To debug: STDERR.puts "Debug messages..."

LEFT_PARTS = ['[', '('].freeze
RIGHT_PARTS = [']', ')'].freeze

def calc_series(rs)
  rs.sum(&:to_r)
end

def calc_parallel(rs)
  1 / rs.sum { |r| 1 / r.to_r }
end

r_hash = name_rs.to_h

temp_circuit = circuit
r_hash.each do |k, v|
  temp_circuit.gsub! k, v.to_s
end

circuit_elements = temp_circuit.split
while circuit_elements.size >= 2
  last_left_part_index = circuit_elements.rindex { |elm| LEFT_PARTS.include? elm }
  pair_right_part_index = circuit_elements[last_left_part_index..].index { |elm| RIGHT_PARTS.include? elm }
  pair_right_part_index += last_left_part_index

  last_left_part = circuit_elements[last_left_part_index]

  rs = circuit_elements[last_left_part_index.next..pair_right_part_index.pred]
  r = last_left_part == '[' ? calc_parallel(rs) : calc_series(rs)

  circuit_elements[last_left_part_index..pair_right_part_index] = r
end

result = circuit_elements.first.to_f.round(1)

# puts "Equivalent Resistance"
puts result
